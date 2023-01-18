global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'maximum');
set(deviceObj.Measurement(5), 'MeasurementType', 'maximum');
Maxim=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
Maxim=num2str(Maxim);
server(Maxim, 4013, -1);
server(Units, 4013, -1);