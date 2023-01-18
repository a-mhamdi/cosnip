function SetTimeBaseScope
global nameHost;
global deviceObj;
TimeBase=client(nameHost, 4013, -1);
TimeBase=str2double(TimeBase);
set(deviceObj.Acquisition, 'Timebase', TimeBase);