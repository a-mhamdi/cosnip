global deviceObj;
set(deviceObj.Measurement(1), 'MeasurementType', 'positivewidth');
set(deviceObj.Measurement(5), 'MeasurementType', 'positivewidth');
PosWidth=get(deviceObj.Measurement(5), 'Value');
Units=get(deviceObj.Measurement(5), 'Units');
PosWidth=num2str(PosWidth);
server(PosWidth, 4013, -1);
server(Units, 4013, -1);