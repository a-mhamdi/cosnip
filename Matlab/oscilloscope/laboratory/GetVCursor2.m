global deviceObj;
VSliderPos2=get(deviceObj.Cursor(1), 'VerticalBarPosition2');
VSliderPos2=num2str(VSliderPos2);
server(VSliderPos2, 4013, -1);