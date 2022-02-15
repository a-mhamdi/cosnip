global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'frequency');
set(deviceObj.Measurement(5), 'MeasurementType', 'frequency');
Freq=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
Freq=num2str(Freq);
server(Freq, 4013, -1);
server(Units, 4013, -1);