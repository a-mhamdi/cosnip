function SetVCursor2
global nameHost;
global deviceObj;
Cursor2=client(nameHost, 4013, -1);
Cursor2=str2double(Cursor2);
set(deviceObj.Cursor(1), 'VerticalBarPosition2', Cursor2);