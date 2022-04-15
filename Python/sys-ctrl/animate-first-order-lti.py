#!/usr/bin/python

#####################
# Author: A. Mhamdi #
#####################

import numpy as np

tspan = np.arange(0, 7, .1)

import control as ctrl

s = ctrl.tf("s")

# Define initial parameters
init_k = 1 
init_tau = 1

def step_H(t, k, tau):
    H = k/(1+tau*s)
    _, y = ctrl.step_response(H, T=t)
    return y

import matplotlib.pyplot as plt
from matplotlib.widgets import Slider, Button

# Create the figure and the line that we will manipulate
fig, ax = plt.subplots()
ax.grid(True)
line, = plt.plot(tspan, step_H(tspan, init_k, init_tau), lw=2)
ax.set_xlabel("Time (sec)")
ax.set_title("Step Response of First-order LTI Plant")

# Adjust the main plot to make room for the sliders
plt.subplots_adjust(left=0.25, bottom=0.25)

# Make a horizontal slider to control the frequency.
ax_k = plt.axes([0.1, 0.25, 0.0225, 0.63])
k_slider = Slider(
    ax=ax_k,
    label=r"$k$",
    valmin=-2.5,
    valmax=2.5,
    valinit=init_k,
    orientation="vertical"
)

# Make a horizontally oriented slider to control `tau`
ax_tau = plt.axes([0.25, 0.1, 0.65, 0.03])
tau_slider = Slider(
    ax=ax_tau,
    label=r"$\tau$",
    valmin=0,
    valmax=3,
    valinit=init_tau,
    orientation="horizontal"
)

# The function to be called anytime a slider's value changes
def update(val):
    tspan = np.arange(0, 7*tau_slider.val, .01) if tau_slider.val >= .15 else np.arange(0, 1, .01)
    y = step_H(tspan, k_slider.val, tau_slider.val)
    line.set_xdata(tspan)
    line.set_ydata(y)
    xlim = (-.1, 7*tau_slider.val) if tau_slider.val >= .15 else (-.1, 1)
    ylim = (0, 1.2*k_slider.val) if k_slider.val > 0 else (1.2*k_slider.val, 0)
    ax.set(xlim=xlim, ylim=ylim)
    fig.canvas.draw_idle()

# Register the update function with each slider
k_slider.on_changed(update)
tau_slider.on_changed(update)

# Create a `matplotlib.widgets.Button` to reset the sliders to initial values.
resetax = plt.axes([0.8, 0.025, 0.1, 0.04])
button = Button(resetax, 'Reset', hovercolor='0.975')

def reset(event):
    k_slider.reset()
    tau_slider.reset()

button.on_clicked(reset)

plt.show()
