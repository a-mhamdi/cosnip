global deviceObj;
TBase=get(deviceObj.Acquisition(1), 'Timebase');
TBase=num2str(TBase);
server(TBase, 4015, -1);