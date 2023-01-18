global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'mean');
set(deviceObj.Measurement(5), 'MeasurementType', 'mean');
Mean=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
Mean=num2str(Mean);
server(Mean, 4013, -1);
server(Units, 4013, -1);