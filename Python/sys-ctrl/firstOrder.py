# 0.5*dy/dt + y(t) = 2*u(t),	y(t=0) = 0
# tau = 0.5 sec & k = 2

import numpy as np
import matplotlib.pyplot as plt

from scipy.integrate import odeint
from scipy.signal import step
from scipy.signal import TransferFunction as tf
from scipy.signal import StateSpace as ss

#########################
# SIMULATION'S SETTINGS #
#########################
k, tau = 2.0, 0.5

############################
# ODE: NUMERIC INTEGRATION #
############################
# 0.5*dy/dt + y(t) = 2*u(t)	<===>	dy/dt = 1/0.5*(-y + 2*u)
def mySys(x, t):
	u = 1
	return 1/0.5*(-x + 2*u)

tspan = np.linspace(0.0, 7.0, 100)
y1 = odeint(mySys, 0, tspan)

######
# TF #
######
hTF = tf([k], [tau, 1])
_, y2 = step(hTF, T=tspan)

######
# SS #
######
A, B, C, D = -1/tau, k/tau, 1, 0
hSS = ss(A, B, C, D)
_, y3 = step(hSS, T=tspan)

plt.plot(tspan, y1, 'r--', linewidth=2, label='ODE')
plt.plot(tspan, y2, 'g--', linewidth=2, label='TF')
plt.plot(tspan, y3, 'b--', linewidth=2, label='SS')

plt.title('Step response of 1st order LTI plant')
plt.xlabel('t (sec)')
plt.ylabel('y(t)')
plt.grid()
plt.legend(loc='best')
plt.show()
