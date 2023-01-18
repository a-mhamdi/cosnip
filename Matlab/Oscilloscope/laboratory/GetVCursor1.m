global deviceObj;
VSliderPos1=get(deviceObj.Cursor(1), 'VerticalBarPosition1');
VSliderPos1=num2str(VSliderPos1);
server(VSliderPos1, 4013, -1);