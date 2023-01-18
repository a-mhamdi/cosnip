function SetCH2BaseScope
global nameHost;
global deviceObj;
CH2Base=client(nameHost, 4013, -1);
CH2Base=str2double(CH2Base);
set(deviceObj.Channel(2), 'Scale', CH2Base);