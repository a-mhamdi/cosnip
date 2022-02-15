global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'minimum');
set(deviceObj.Measurement(5), 'MeasurementType', 'minimum');
Minim=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
Minim=num2str(Minim);
server(Minim, 4013, -1);
server(Units, 4013, -1);