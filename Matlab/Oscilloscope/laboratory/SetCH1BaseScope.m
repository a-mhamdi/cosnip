function SetCH1BaseScope
global nameHost;
global deviceObj;
CH1Base=client(nameHost, 4013, -1);
CH1Base=str2double(CH1Base);
set(deviceObj.Channel(1), 'Scale', CH1Base);