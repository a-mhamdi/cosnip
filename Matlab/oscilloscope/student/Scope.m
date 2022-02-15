function varargout = Scope(varargin)
% SCOPE M-file for Scope.fig
%      SCOPE, by itself, creates a new SCOPE or raises the existing
%      singleton*.
%
%      H = SCOPE returns the handle to a new SCOPE or the handle to
%      the existing singleton*.
%
%      SCOPE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCOPE.M with the given input arguments.
%
%      SCOPE('Property','Value',...) creates a new SCOPE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Scope_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Scope_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help Scope
% Last Modified by GUIDE v2.5 14-Apr-2010 16:27:18
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Scope_OpeningFcn, ...
                   'gui_OutputFcn',  @Scope_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before Scope is made visible.
function Scope_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Scope (see VARARGIN)
% Choose default command line output for Scope
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
if strcmp(get(hObject,'Visible'),'off')
    load EspritLogo;
    axes(handles.EspritLogoAxes);
    image (cdata);
    colormap(colormap);
    grid on;
end
% changeIcon
%{
jFrame=get(handles.figure1,'javaframe');
jIcon=javax.swing.ImageIcon('tek_tds1002.gif');
jFrame.setFigureIcon(jIcon);
%}
% UIWAIT makes Scope wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = Scope_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in VisualizeTag.
function VisualizeTag_Callback(hObject, eventdata, handles)
% hObject    handle to VisualizeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Status = get(hObject, 'Value');
global HScopeImage;
if (Status==1)
    axes(handles.AxesVideo);
    obj=videoinput('winvideo', 1);
    set(obj, 'selectedsourcename', 'input1');
% Create an image object for previewing.
    vidRes = get(obj, 'VideoResolution');
    nBands = get(obj, 'NumberOfBands');
    HScopeImage = image( zeros(vidRes(2), vidRes(1), nBands) );
    HScopeImage=preview(obj, HScopeImage);
    set(handles.VisualizeTag, 'String', 'Stop Visualizing');
else delete(HScopeImage);
     set(handles.VisualizeTag, 'String', 'Visualize');
end
% --- Executes on button press in ConnectDisconnectTag.
function ConnectDisconnectTag_Callback(hObject, eventdata, handles)
% hObject    handle to ConnectDisconnectTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StatusFormatDisplay;
Status=get(hObject, 'Value');
if (Status==1)
    % Create a GPIB object.
    global deviceObj;
    global interfaceObj;
    interfaceObj = instrfind('Type', 'gpib', 'BoardIndex', 0, 'PrimaryAddress', 1, 'Tag', '');
    % Create the GPIB object if it does not exist
    % otherwise use the object that was found.
        if isempty(interfaceObj)
        interfaceObj = gpib('Keithley', 0, 1);
        else
    fclose(interfaceObj);
    interfaceObj = interfaceObj(1);
        end
    % Create a device object. 
    deviceObj = icdevice('tektronix_tds1002.mdd', interfaceObj);
    % Connect device object to hardware.
    connect(deviceObj);
    set(deviceObj.Acquisition, 'State', 'run');
    StatusFormatDisplay='YT';
    set(deviceObj.Channel(1), 'Probe', 1.0);
    set(deviceObj.Channel(2), 'Probe', 1.0);
    set(deviceObj.Channel, 'Coupling', 'ac');
    set(deviceObj.Display, 'Format', 'yt');
    set(deviceObj.Cursor(1), 'CursorType', 'none');
    set(handles.ConnectDisconnectTag, 'String', 'Connected', 'BackgroundColor','green');
else
    disconnect(deviceObj);
    delete(deviceObj);
    set(handles.ConnectDisconnectTag, 'String', 'Disconnected', 'BackgroundColor','red');
end
% --- Executes on button press in AutosetTag.
function AutosetTag_Callback(hObject, eventdata, handles)
% hObject    handle to AutosetTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Trigger_1.
global StatusFormatDisplay;
invoke(deviceObj, 'autoset');
if (strcmp(StatusFormatDisplay, 'XY'))
    set(handles.FormatDisplayTag, 'SelectedObject', handles.YTTag);
    set(deviceObj.Display, 'Format', 'yt');
    StatusFormatDisplay='YT';
end
axes(handles.AxesTime);
cla;
function Channel1Tag_Callback(hObject, eventdata, handles)
% hObject    handle to Channel1Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns Channel1Tag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Channel1Tag
% --- Executes during object creation, after setting all properties.
CH1Base = str2double(get(hObject, 'String'));
if isnan(CH1Base)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.CH1Base = CH1Base;
guidata(hObject,handles)
function Channel1Tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Channel1Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in Channel2_1.
function Channel2_1_Callback(hObject, eventdata, handles)
% hObject    handle to Channel2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns Channel2_1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Channel2_1
% --- Executes during object creation, after setting all properties.
function Channel2_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Channel2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in TimeBaseTag.
function TimeBaseTag_Callback(hObject, eventdata, handles)
% hObject    handle to TimeBaseTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns TimeBaseTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TimeBaseTag
% --- Executes during object creation, after setting all properties.
TimeBase = str2double(get(hObject, 'String'));
if isnan(TimeBase)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.TimeBase=TimeBase;
guidata(hObject,handles);
function TimeBaseTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TimeBaseTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
% --- Executes on selection change in SourceTag.
function SourceTag_Callback(hObject, eventdata, handles)
% hObject    handle to SourceTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns SourceTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SourceTag
% --- Executes during object creation, after setting all properties.
function SourceTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SourceTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function MeasTag_Callback(hObject, eventdata, handles)
% hObject    handle to MeasTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns MeasTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MeasTag
% --- Executes during object creation, after setting all properties.
Measurement;
function MeasTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeasTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in SelectChannelTag.
function SelectChannelTag_Callback(hObject, eventdata, handles)
% hObject    handle to SelectChannelTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns SelectChannelTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectChannelTag
% --- Executes during object creation, after setting all properties.
popup_sel_index = get(handles.SelectChannelTag, 'Value');
switch popup_sel_index
    case 4
        set(deviceObj, 'Math', 'ch1 + ch2');
    case 5
        set(deviceObj, 'Math', 'ch1 - ch2');
    case 6
        set(deviceObj, 'Math', 'ch2 - ch1');
end
function SelectChannelTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectChannelTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in InvertSignalTag.
function InvertSignalTag_Callback(hObject, eventdata, handles)
% hObject    handle to InvertSignalTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on selection change in ObjectSelectorTag.
function ObjectSelectorTag_Callback(hObject, eventdata, handles)
% hObject    handle to ObjectSelectorTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns ObjectSelectorTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ObjectSelectorTag
% --- Executes during object creation, after setting all properties.
function ObjectSelectorTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ObjectSelectorTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in LanguageTag.
function LanguageTag_Callback(hObject, eventdata, handles)
% hObject    handle to LanguageTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
popup_sel_index = get(handles.LanguageTag, 'Value');
switch popup_sel_index
    case 1
        set(deviceObj, 'Language', 'english');
    case 2
        set(deviceObj, 'Language', 'french');
end
function ValuePosTag_Callback(hObject, eventdata, handles)
% hObject    handle to ValuePosTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of ValuePosTag as text
%        str2double(get(hObject,'String')) returns contents of ValuePosTag as a double
% --- Executes during object creation, after setting all properties.
function ValuePosTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ValuePosTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function CursorTypeGroup_SelectionChangeFcn(hObject, eventdata, handles)
global deviceObj;
if (hObject == handles.NoneTag)
    delete(VBar);
    delete(HBar);
    set(deviceObj.Cursor(1), 'CursorType', 'none');
else
    if (hObject == handles.TimeBar)
    set(deviceObj.Cursor(1), 'CursorType', 'verticalBars');
    VBar;
    delete(HBar);
    else if (hObject == handles.AmplitudeBar)
    set(deviceObj.Cursor(1), 'CursorType', 'horizontalBars');
    HBar;
    delete(VBar);
        end
    end
end
% --- Executes when selected object is changed in CouplingGroup.
function CouplingGroup_SelectionChangeFcn(hObject, eventdata, handles)
if (hObject == handles.ACTag)
    set(deviceObj.Channel, 'Coupling', 'ac');;
else if (hObject == handles.DCTag)
    set(deviceObj.Channel, 'Coupling', 'dc');
    else if (hObject==handles.GroundTag)
        set(deviceObj.Channel, 'Coupling', 'ground');
        end
    end
end
% --- Executes on selection change in Channel2Tag.
function Channel2Tag_Callback(hObject, eventdata, handles)
% hObject    handle to Channel2Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns Channel2Tag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Channel2Tag
% --- Executes during object creation, after setting all properties.
CH2Base = str2double(get(hObject, 'String'));
if isnan(CH2Base)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new volume value
handles.CH2Base = CH2Base;
guidata(hObject,handles)
function Channel2Tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Channel2Tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes when selected object is changed in Probe1Group.
function Probe1Group_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in Probe1Group 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.Probe11Tag)
    set(deviceObj.Channel(1), 'Probe', 1.0);
else
    set(deviceObj.Channel(1), 'Probe', 10.0);
end
% --- Executes when selected object is changed in Probe2Group.
function Probe2Group_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in Probe2Group 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.Probe21Tag)
    set(deviceObj.Channel(2), 'Probe', 1.0);
else
    set(deviceObj.Channel(2), 'Probe', 10.0);
end
% --- Executes during object creation, after setting all properties.
function CursorTypeGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CursorTypeGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes on button press in PositionTag.
function PositionTag_Callback(hObject, eventdata, handles)
% hObject    handle to PositionTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Position;
% --- Executes on button press in UpdateTag.
function UpdateTag_Callback(hObject, eventdata, handles)
% hObject    handle to UpdateTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.AxesTime);
cla;
popup_sel_index = get(handles.SelectChannelTag, 'Value');
global StatusFormatDisplay;
global VerticalAxesData;
global HorizontalAxesData;
if (strcmp(StatusFormatDisplay, 'YT'))
switch popup_sel_index
    case 1
        groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
plot(X, Y);
title('CH1:Amplitude Vs Time');
xlabel(['Time ', Xunit], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', Yunit], 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Y;
HorizontalAxesData=X;
    case 2
groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
plot(X, Y);
title('CH2:Amplitude Vs Time');
xlabel(['Time ', Xunit], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', Yunit], 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Y;
HorizontalAxesData=X;
    case 3
        groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y1, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
[Y2, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
plot(X, Y1, X, Y2);
title('CH1&CH2:Amplitude Vs Time');
xlabel(['Time ', Xunit], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', Yunit], 'fontsize',10,'fontweight','b');
legend('CH1', 'CH2');
grid on;
VerticalAxesData=[Y1; Y2];
%VerticalAxesData.CH2Data=Y2;
HorizontalAxesData=X;
    case 4
        groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y1, X, Y1unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
[Y2, X, Y2unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
Y=Y1+Y2;
plot(X, Y);
title('CH1+CH2:Amplitude Vs Time');
xlabel(['Time ', Xunit], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', Yunit], 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Y;
HorizontalAxesData=X;
    case 5
        groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y1, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
[Y2, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
Y=Y1-Y2;
plot(X, Y);
title('CH1-CH2:Amplitude Vs Time');
xlabel(['Time ', Xunit], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', Yunit], 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Y;
HorizontalAxesData=X;

    case 6
groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y1, X, Y1unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
[Y2, X, Y2unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
Y=Y2-Y1;
plot(X, Y);
title('CH2-CH1:Amplitude Vs Time');
xlabel(['Time ', Xunit], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', Yunit], 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Y;
HorizontalAxesData=X;
    case 7
groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
%FFT
S=fft(Y);
n=length(Y);
Power=abs(S(1:floor(n/2))).^2;
nyquist = 1/2;
Freq = (1:n/2)/(n/2)*nyquist;
plot(Freq, Power);
title('CH1:Spectrum Amplitude Vs Frequency');
xlabel('Frequency Hz', 'fontsize',10,'fontweight','b');
ylabel('Amplitude dB', 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Power;
HorizontalAxesData=Freq;
    case 8
        groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y, X, Yunit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
%FFT
S=fft(Y);
n=length(Y);
Power=abs(S(1:floor(n/2))).^2;
nyquist = 1/2;
Freq = (1:n/2)/(n/2)*nyquist;
plot(Freq, Power);
title('CH2:Spectrum Amplitude Vs Frequency');
xlabel('Frequency Hz', 'fontsize',10,'fontweight','b');
ylabel('Amplitude dB', 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Power;
HorizontalAxesData=Freq;
end
else if (strcmp(StatusFormatDisplay, 'XY'))
        groupObj = get(deviceObj, 'Waveform');
groupObj = groupObj(1);
[Y1, X, Y1unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel1');
[Y2, X, Y2unit, Xunit] = invoke(groupObj, 'readwaveform', 'channel2');
plot(Y1, Y2);
title('CH2 Vs CH1');
xlabel(['Amplitude CH1 ', Y1unit], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude CH2 ', Y2unit], 'fontsize',10,'fontweight','b');
grid on;
VerticalAxesData=Y2;
HorizontalAxesData=Y1;
    end
end
handles.Data.VerticalAxesData=VerticalAxesData;
handles.Data.HorizontalAxesData=HorizontalAxesData;
guidata(hObject, handles);
% --- Executes when selected object is changed in FormatDisplayTag.
function FormatDisplayTag_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in FormatDisplayTag 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global StatusFormatDisplay;
switch hObject
    case handles.YTTag
   set(deviceObj.Display, 'Format', 'yt');
   StatusFormatDisplay='YT';
    case handles.XYTag
    set(deviceObj.Display, 'Format', 'xy');
   StatusFormatDisplay='XY';
end
% --- Executes on button press in SetTimeTag.
function SetTimeTag_Callback(hObject, eventdata, handles)
% hObject    handle to SetTimeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObj;
TimeBase=handles.TimeBase;
set(deviceObj.Acquisition, 'Timebase', TimeBase);
% --- Executes on button press in SetCH1Base.
function SetCH1Base_Callback(hObject, eventdata, handles)
% hObject    handle to SetCH1Base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObj;
CH1Base=handles.CH1Base;
set(deviceObj.Channel(1), 'Scale', CH1Base);
% --- Executes on button press in SetCH2Base.
function SetCH2Base_Callback(hObject, eventdata, handles)
% hObject    handle to SetCH2Base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObj;
CH2Base=handles.CH2Base;
set(deviceObj.Channel(2), 'Scale', CH2Base);
% --- Executes on button press in BandWidthLimitTag.
function BandWidthLimitTag_Callback(hObject, eventdata, handles)
% hObject    handle to BandWidthLimitTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of BandWidthLimitTag
Status=get(handles.BandWidthLimitTag, 'Value');
if (Status==1)
   set(handles.BandWidthLimitTag, 'String', 'OFF');
   set(deviceObj.Channel, 'BandwidthLimit', 'on');
else
   set(handles.BandWidthLimitTag, 'String', 'ON');
   set(deviceObj.Channel, 'BandwidthLimit', 'off');
end
% --- Executes on button press in RunStopTag.
function RunStopTag_Callback(hObject, eventdata, handles)
% hObject    handle to RunStopTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of RunStopTag
StatusRS = get(handles.RunStopTag, 'Value');
if (StatusRS==1)
   set(handles.RunStopTag, 'String', 'Run');
   set(deviceObj.Acquisition, 'State', 'stop');
else
   set(handles.RunStopTag, 'String', 'Stop');
   set(deviceObj.Acquisition, 'State', 'run');
end
% --- Executes on selection change in ScaleTag.
function ScaleTag_Callback(hObject, eventdata, handles)
% hObject    handle to ScaleTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns ScaleTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ScaleTag
PopIndex= get(handles.ScaleTag, 'Value');
switch PopIndex
    case 1
        set(handles.AxesTime, 'XScale', 'linear', 'YScale', 'linear');
    case 2
        set(handles.AxesTime, 'XScale', 'log', 'YScale', 'linear');
    case 3
        set(handles.AxesTime, 'XScale', 'linear', 'YScale', 'log');
    case 4
        set(handles.AxesTime, 'XScale', 'log', 'YScale', 'log');
end
% --- Executes during object creation, after setting all properties.
function ScaleTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ScaleTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in TriggerControlTag.
function TriggerControlTag_Callback(hObject, eventdata, handles)
% hObject    handle to TriggerControlTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TriggerControl;
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
Status=get(handles.ConnectDisconnectTag, 'Value');
StatusIm = get(handles.VisualizeTag, 'Value');
if(Status==1)
    warndlg('Disconnect from instrument before quiting','Instrument Control Warning');
else if(StatusIm==1)
        warndlg('Press The Button Stop Visualizing','Image Acquisition Warning');
else 
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name')],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end
    delete(handles.figure1);
    end
end
% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function CloseTag_Callback(hObject, eventdata, handles)
% hObject    handle to CloseTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Status=get(handles.ConnectDisconnectTag, 'Value');
StatusIm = get(handles.VisualizeTag, 'Value');
if(Status==1)
    warndlg('Disconnect from instrument before quiting','Instrument Control Warning');
else if(StatusIm==1)
        warndlg('Press The Button Stop Visualizing','Image Acquisition Warning');
else 
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name')],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end
    delete(handles.figure1);
    end
end
% --------------------------------------------------------------------
function SaveDataTag_Callback(hObject, eventdata, handles)
% hObject    handle to SaveDataTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Data=handles.Data;
uisave('Data');
% --------------------------------------------------------------------
function PrintTag_Callback(hObject, eventdata, handles)
% hObject    handle to PrintTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1);
% --------------------------------------------------------------------
function AboutScopeTag_Callback(hObject, eventdata, handles)
% hObject    handle to AboutScopeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AboutScope;
% --------------------------------------------------------------------
function HelpTag_Callback(hObject, eventdata, handles)
% hObject    handle to HelpTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function ToolsTag_Callback(hObject, eventdata, handles)
% hObject    handle to ToolsTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function DataCursorTag_Callback(hObject, eventdata, handles)
% hObject    handle to DataCursorTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datacursormode(handles.figure1, 'on');
% --- Executes on button press in ClearTag.
function ClearTag_Callback(hObject, eventdata, handles)
% hObject    handle to ClearTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ClearTag
axes(handles.AxesTime);
cla(handles.AxesTime, 'reset');
grid on;
% --------------------------------------------------------------------
function ZoomInTag_Callback(hObject, eventdata, handles)
% hObject    handle to ZoomInTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom(handles.figure1,'inmode');
% --------------------------------------------------------------------
function ZoomOutTag_Callback(hObject, eventdata, handles)
% hObject    handle to ZoomOutTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom(handles.figure1,'outmode');
% --- Executes on button press in QuitPushTag.
function QuitPushTag_Callback(hObject, eventdata, handles)
% hObject    handle to QuitPushTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Status=get(handles.ConnectDisconnectTag, 'Value');
StatusIm = get(handles.VisualizeTag, 'Value');
if(Status==1)
    warndlg('Disconnect from instrument before quiting','Instrument Control Warning');
else if(StatusIm==1)
        warndlg('Press The Button Stop Visualizing','Image Acquisition Warning');
else 
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name')],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end
    delete(handles.figure1);
    end
end

