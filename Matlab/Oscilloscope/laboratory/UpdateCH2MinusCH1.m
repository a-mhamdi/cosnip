global deviceObj;
groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y1, X, Y1unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
[Y2, X, Y2unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
Y=Y2-Y1;
T2=length(Y);
T1=X(2)-X(1);
T1=num2str(T1);
server(T1, 4015, -1);
T2Str=num2str(T2);
server(T2Str, 4015, -1);
for i=1:T2,
Temp=Y(i);
Temp=num2str(Temp);
server(Temp, 4015, -1);
end