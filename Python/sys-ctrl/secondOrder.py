# d2y/dt2 + 2*m*o*dy/dt + o2*y(t) = k*o2*u(t),	y(t=0) = 0 & dy(t=0)/dt = 0

import numpy as np
import matplotlib.pyplot as plt

from scipy.integrate import odeint
from scipy.signal import step
from scipy.signal import TransferFunction as tf
from scipy.signal import StateSpace as ss

#########################
# SIMULATION'S SETTINGS #
#########################
k, m, o = 1, 1, 1.5

############################
# ODE: NUMERIC INTEGRATION #
############################
# d2y/dt2 + 2*m*o*dy/dt + o2*y(t) = k*o2*u(t) 	<===> d2y/dt2 = -2*m*o*dy/dt - o2*y(t) + k*o2*u(t)
def mySys(x, t):
	u = 1
	dotx = [x[1], -o**2*x[0]-2*m*o*x[1] + k*o**2*u]
	return dotx

tspan = np.linspace(0.0, 10.0, 100)
vect = odeint(mySys, [0, 0], tspan)
y1 = vect[:, 0]


######
# TF #
######
hTF = tf([k*o**2], [1, 2*m*o, o**2])
_, y2 = step(hTF, T=tspan)

######
# SS #
######
A, B, C, D = np.array([[0, 1], [-o**2, -2*m*o]]), np.array([[0], [k*o**2]]), np.array([[1, 0]]), np.array([[0]])
hSS = ss(A, B, C, D)
_, y3 = step(hSS, T=tspan)

plt.plot(tspan, y1, 'r--', linewidth=2, label='ODE')
plt.plot(tspan, y2, 'g--', linewidth=2, label='TF')
plt.plot(tspan, y3, 'b--', linewidth=2, label='SS')

plt.title('Step response of 2nd order LTI plant')
plt.xlabel('t (sec)')
plt.ylabel('y(t)')
plt.grid()
plt.legend(loc='best')
plt.show()


