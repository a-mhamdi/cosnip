global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'peak2peak');
set(deviceObj.Measurement(5), 'MeasurementType', 'peak2peak');
peak2peak=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
peak2peak=num2str(peak2peak);
server(peak2peak, 4013, -1);
server(Units, 4013, -1);