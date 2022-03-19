using ControlSystems

s = tf("s")
sys = s/(s+1)
t = 2:.5:10
# PLOT THE STEP RESPONSE
plot(step(sys,t))
# PLOT BODE FREQUENCY RESPONSE
bodeplot(sys)
# PLOT NYQUIST FREQUENCY RESPONSE
nyquistplot(sys)
# PLOT NICHOLS FREQUENCY RESPONSE
nicholsplot(sys)

