function varargout = TriggerControl(varargin)
% TRIGGERCONTROL M-file for TriggerControl.fig
%      TRIGGERCONTROL, by itself, creates a new TRIGGERCONTROL or raises the existing
%      singleton*.
%
%      H = TRIGGERCONTROL returns the handle to a new TRIGGERCONTROL or the handle to
%      the existing singleton*.
%
%      TRIGGERCONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRIGGERCONTROL.M with the given input arguments.
%
%      TRIGGERCONTROL('Property','Value',...) creates a new TRIGGERCONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TriggerControl_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TriggerControl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help TriggerControl
% Last Modified by GUIDE v2.5 01-Apr-2010 01:43:06
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TriggerControl_OpeningFcn, ...
                   'gui_OutputFcn',  @TriggerControl_OutputFcn, ...
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
% --- Executes just before TriggerControl is made visible.
function TriggerControl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TriggerControl (see VARARGIN)
% Choose default command line output for TriggerControl
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% changeIcon
%{
jFrame=get(handles.figure1,'javaframe');
jIcon=javax.swing.ImageIcon('tek_tds1002.gif');
jFrame.setFigureIcon(jIcon);
%}
% UIWAIT makes TriggerControl wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = TriggerControl_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on selection change in TriggerModeTag.
function TriggerModeTag_Callback(hObject, eventdata, handles)
% hObject    handle to TriggerModeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns TriggerModeTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TriggerModeTag
popup_sel_index = get(handles.TriggerModeTag, 'Value');
switch popup_sel_index
    case 1
        set(deviceObj.Trigger, 'Mode', 'auto');
    case 2
        set(deviceObj.Trigger, 'Mode', 'normal');
end
% --- Executes during object creation, after setting all properties.
function TriggerModeTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TriggerModeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in TriggerSlopeTag.
function TriggerSlopeTag_Callback(hObject, eventdata, handles)
% hObject    handle to TriggerSlopeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns TriggerSlopeTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TriggerSlopeTag
popup_sel_index = get(handles.TriggerSlopeTag, 'Value');
switch popup_sel_index
    case 1
        set(deviceObj.Trigger, 'Slope', 'rising');
    case 2
        set(deviceObj.Trigger, 'Slope', 'falling');
end
% --- Executes during object creation, after setting all properties.
function TriggerSlopeTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TriggerSlopeTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in TriggerSourceTag.
function TriggerSourceTag_Callback(hObject, eventdata, handles)
% hObject    handle to TriggerSourceTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns TriggerSourceTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TriggerSourceTag
popup_sel_index = get(handles.TriggerSourceTag, 'Value');
switch popup_sel_index
    case 1
        set(deviceObj.Trigger, 'Source', 'channel1');
    case 2
        set(deviceObj.Trigger, 'Source', 'channel2');
    case 3
        set(deviceObj.Trigger, 'Source', 'external');
    case 4
        set(deviceObj.Trigger, 'Source', 'external5');
end
% --- Executes during object creation, after setting all properties.
function TriggerSourceTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TriggerSourceTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in TriggerCouplTag.
function TriggerCouplTag_Callback(hObject, eventdata, handles)
% hObject    handle to TriggerCouplTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns TriggerCouplTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TriggerCouplTag
list_sel_index = get(handles.TriggerCouplTag, 'Value');
switch list_sel_index
    case 1
        set(deviceObj.Trigger, 'Coupling', 'ac');
    case 2
        set(deviceObj.Trigger, 'Coupling', 'dc');
    case 3
        set(deviceObj.Trigger, 'Coupling', 'highFreqRejection');
    case 4
        set(deviceObj.Trigger, 'Coupling', 'lowFreqRejection');
    case 5
        set(deviceObj.Trigger, 'Coupling', 'noiseRejection');       
end
% --- Executes during object creation, after setting all properties.
function TriggerCouplTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TriggerCouplTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


