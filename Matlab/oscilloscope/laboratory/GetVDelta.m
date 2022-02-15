global deviceObj;
VVDelta=get(deviceObj.Cursor(1), 'VerticalBarDelta');
VUDelta=get(deviceObj.Cursor(1), 'VerticalBarUnits');
VVDelta=num2str(VVDelta);
server(VVDelta, 4013, -1);
server(VUDelta, 4013, -1);