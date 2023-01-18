% Create a GPIB object.
global deviceObj;
global interfaceObj;
interfaceObj = instrfind('Type', 'gpib', 'BoardIndex', 0, 'PrimaryAddress', 1, 'Tag', '');
% Create the GPIB object if it does not exist
% otherwise use the object that was found.
if isempty(interfaceObj)
    interfaceObj = gpib('NI', 0, 1);
else
    fclose(interfaceObj);
    interfaceObj = interfaceObj(1);
end
% Create a device object. 
deviceObj = icdevice('tektronix_tds1002.mdd', interfaceObj);
% Connect device object to hardware.
connect(deviceObj);