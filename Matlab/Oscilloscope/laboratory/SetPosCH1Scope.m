function SetPosCH1Scope
global nameHost;
global deviceObj;
PosCH1=client(nameHost, 4013, -1);
PosCH1=str2double(PosCH1);
set(deviceObj.Channel(1), 'Position', PosCH1);