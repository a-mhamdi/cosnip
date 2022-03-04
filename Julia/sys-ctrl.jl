using ControlSystems

s = tf("s")
sys = s/(s+1)
t = 2:.5:10
stepplot(sys,t)
bodeplot(sys)
nyquistplot(sys)
nicholsplot(sys)

