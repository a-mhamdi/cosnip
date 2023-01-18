global deviceObj;
groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
%FFT
S=fft(Y);
n=length(Y);
Power=abs(S(1:floor(n/2))).^2;
nyquist = 1/2;
Freq = (1:n/2)/(n/2)*nyquist;
Y=Y1-Y2;
T2=length(Power);
T1=Freq(2)-Freq(1);
T1=num2str(T1);
server(T1, 4015, -1);
T2Str=num2str(T2);
server(T2Str, 4015, -1);
for i=1:T2,
Temp=Power(i);
Temp=num2str(Temp);
server(Temp, 4015, -1);
end