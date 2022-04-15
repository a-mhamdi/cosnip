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
init_o = 1
init_zeta = 1

def step_H(t, k, o, zeta):
    H = (k*o**2)/(o**2+2*zeta*o*s+s**2)
    _, y = ctrl.step_response(H, T=t)
    return y

import matplotlib.pyplot as plt
from matplotlib.widgets import Slider, Button

# Create the figure and the line that we will manipulate
fig, ax = plt.subplots()
ax.grid(True)
line, = plt.plot(tspan, step_H(tspan, init_k, init_o, init_zeta), lw=2)
ax.set_xlabel("Time (sec)")
ax.set_title("Step Response of Second-order LTI Plant")

# Adjust the main plot to make room for the sliders
plt.subplots_adjust(left=0.25, bottom=0.3)

# Make a vertically oriented slider to control `k`.
ax_k = plt.axes([0.1, 0.25, 0.0225, 0.63])
k_slider = Slider(
    ax=ax_k,
    label=r"$k$",
    valmin=-2.5,
    valmax=2.5,
    valinit=init_k,
    orientation="vertical"
)

# Make a horizontally oriented slider to control `o`
ax_o = plt.axes([0.25, .15, 0.65, 0.03])
o_slider = Slider(
    ax=ax_o,
    label=r"$\omega_n$",
    valmin=0,
    valmax=3,
    valinit=init_o,
    orientation="horizontal"
)

# Make a horizontally oriented slider to control `zeta`
ax_zeta = plt.axes([0.25, .075, 0.65, 0.03])
zeta_slider = Slider(
    ax=ax_zeta,
    label=r"$\zeta$",
    valmin=0,
    valmax=3,
    valinit=init_zeta,
    orientation="horizontal"
)

# The function to be called anytime a slider's value changes
def update(val):
    tspan = np.arange(0, 7/o_slider.val, .01) if o_slider.val != 0 else np.arange(0, 1, .01)
    y = step_H(tspan, k_slider.val, o_slider.val, zeta_slider.val)
    line.set_xdata(tspan)
    line.set_ydata(y)
    xlim = (0, tspan.max())
    ylim = (0, 1.2*y.max()) if k_slider.val > 0 else (-1.2*np.abs(y.min()), 0)
    ax.set(xlim=xlim, ylim=ylim)
    fig.canvas.draw_idle()

# Register the update function with each slider
k_slider.on_changed(update)
o_slider.on_changed(update)
zeta_slider.on_changed(update)

# Create a `matplotlib.widgets.Button` to reset the sliders to initial values.
resetax = plt.axes([0.8, 0.025, 0.1, 0.04])
button = Button(resetax, 'Reset', hovercolor='0.975')

def reset(event):
    k_slider.reset()
    o_slider.reset()
    zeta_slider.reset()

button.on_clicked(reset)

plt.show()
