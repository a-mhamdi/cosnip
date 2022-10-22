# SQUARE WAVE
# 4/pi*(sin(wt)/1+sin(3wt)/3+sin(5wt)/5+...)

using Waveforms
# https://juliapackages.com/p/waveforms
using LaTeXStrings
using Plots

t = range(-3, 5, step=.01)
wt = 2*pi*t/1 # Frequency = 1Hz

plot(squarewave, wt, label=L"x(t)")

series = [ 4/(k*pi)*[ sin(k*theta) for theta in wt ] for k in range(1, 20, step=2) ]
xapp = sum(series, dims=1)

plot!(wt, xapp, label=L"\dfrac{4}{\pi}\sum_{k\in\left\{1;\ 3;\ 5\; \cdots\right\}}\dfrac{\sin(2k\pi \dfrac{t}{T})}{k}")

