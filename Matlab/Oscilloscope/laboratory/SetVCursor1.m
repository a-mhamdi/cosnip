function SetVCursor1
global nameHost;
global deviceObj;
Cursor1=client(nameHost, 4013, -1);
Cursor1=str2double(Cursor1);
set(deviceObj.Cursor(1), 'VerticalBarPosition1', Cursor1);