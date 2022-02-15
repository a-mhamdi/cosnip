global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'crms');
set(deviceObj.Measurement(5), 'MeasurementType', 'crms');
crms=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
crms=num2str(crms);
server(crms, 4013, -1);
server(Units, 4013, -1);