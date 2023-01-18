global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'period');
set(deviceObj.Measurement(5), 'MeasurementType', 'period');
Period=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
Period=num2str(Period);
server(Period, 4013, -1);
server(Units, 4013, -1);