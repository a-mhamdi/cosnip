function SetPosCH2Scope
global nameHost;
global deviceObj;
PosCH2=client(nameHost, 4013, -1);
PosCH2=str2double(PosCH2);
set(deviceObj.Channel(2), 'Position', PosCH2);