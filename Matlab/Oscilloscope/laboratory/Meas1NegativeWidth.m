global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'negativewidth');
set(deviceObj.Measurement(5), 'MeasurementType', 'negativewidth');
NegWidth=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
NegWidth=num2str(NegWidth);
server(NegWidth, 4013, -1);
server(Units, 4013, -1);