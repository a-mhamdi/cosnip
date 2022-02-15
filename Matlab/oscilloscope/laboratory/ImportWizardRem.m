global deviceObject;
global nameHost;
n=client(nameHost, 4015, -1);
n=str2double(n);
for j=1:n,
   Y=client(nameHost, 4015, -1);
   Y=str2double(Y);
   Amplitude(j)=Y;
end
Freq=client(nameHost, 4015, -1);
Freq=str2double(Freq);
groupObj = get(deviceObject, 'Arbitrarywaveform');
groupObj = groupObj(1);
invoke(groupObj, 'setwaveform', 'excit');
groupObj = get(deviceObject, 'Arbitrarywaveform');
invoke(groupObj, 'create', 'excit', Amplitude);
set(deviceObject.Arbitrarywaveform(1), 'Frequency', Freq);
set(deviceObject, 'Waveform', 'user');
set(deviceObject.Arbitrarywaveform(1), 'CurrentWaveformName', 'excit');