function varargout = HBar(varargin)
% HBAR M-file for HBar.fig
%      HBAR, by itself, creates a new HBAR or raises the existing
%      singleton*.
%
%      H = HBAR returns the handle to a new HBAR or the handle to
%      the existing singleton*.
%
%      HBAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HBAR.M with the given input arguments.
%
%      HBAR('Property','Value',...) creates a new HBAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HBar_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HBar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help HBar
% Last Modified by GUIDE v2.5 08-Apr-2010 01:31:01
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HBar_OpeningFcn, ...
                   'gui_OutputFcn',  @HBar_OutputFcn, ...
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
% --- Executes just before HBar is made visible.
function HBar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HBar (see VARARGIN)
% Choose default command line output for HBar
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% changeIcon
%{
jFrame=get(handles.figure1,'javaframe');
jIcon=javax.swing.ImageIcon('tek_tds1002.gif');
jFrame.setFigureIcon(jIcon);
%}
% UIWAIT makes HBar wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global deviceObj;
set(deviceObj.Cursor(1), 'Source', 'channel1');
ScaleCH=get(deviceObj.Channel(1), 'Scale');
handles.ScaleCH=ScaleCH;
guidata( hObject, handles);
% --- Outputs from this function are returned to the command line.
function varargout = HBar_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
% --- Executes on slider movement.
function HSlider1Tag_Callback(hObject, eventdata, handles)
global deviceObj;
SliderPos1=get(hObject, 'Value');
ScaleCH=handles.ScaleCH;
Cursor1Pos=ScaleCH*SliderPos1;
set(deviceObj.Cursor, 'HorizontalBarPosition1', Cursor1Pos);
% --- Executes during object creation, after setting all properties.
function HSlider1Tag_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes during object creation, after setting all properties.
function HPos1_CreateFcn(hObject, eventdata, handles)
% --- Executes on button press in GetHPos1.
function GetHPos1_Callback(hObject, eventdata, handles)
global deviceObj;
HBarPos1=get(deviceObj.Cursor(1), 'HorizontalBarPosition1');
HBarPos1=num2str(HBarPos1);
Msg=strcat('Function completed successfully. Your Current Horizontal Bar Position is: ', HBarPos1, 'Volt');
set(handles.HPos1, 'String', Msg);
% --- Executes on slider movement.
function HSlider2Tag_Callback(hObject, eventdata, handles)
global deviceObj;
SliderPos2=get(hObject, 'Value');
ScaleCH=handles.ScaleCH;
Cursor2Pos=ScaleCH*SliderPos2;
set(deviceObj.Cursor, 'HorizontalBarPosition2', Cursor2Pos);
% --- Executes during object creation, after setting all properties.
function HSlider2Tag_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on button press in GetHPos2.
function GetHPos2_Callback(hObject, eventdata, handles)
global deviceObj;
HBarPos2=get(deviceObj.Cursor(1), 'HorizontalBarPosition2');
HBarPos2=num2str(HBarPos2);
Msg=strcat('Function completed successfully. Your Current Horizontal Bar Position is: ', HBarPos2,  ' Volt');
set(handles.HPos2, 'String', Msg);
% --- Executes on button press in GetHDelta.
function GetHDelta_Callback(hObject, eventdata, handles)
global deviceObj;
HBVDelta = get(deviceObj.Cursor(1), 'HorizontalBarDelta');
HBUDelta = get(deviceObj.Cursor(1), 'HorizontalBarUnits');
HBVDelta=num2str(HBVDelta);
Temp=strcat(HBVDelta, HBUDelta);
set(handles.HDelta, 'String', Temp);
% --- Executes on selection change in SelectChannelTag.
function SelectChannelTag_Callback(hObject, eventdata, handles)
% hObject    handle to SelectChannelTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns SelectChannelTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectChannelTag
global deviceObj;
PopIndexChannel=get(handles.SelectChannelTag, 'Value');
switch PopIndexChannel
    case 1
    set(deviceObj.Cursor(1), 'Source', 'channel1');
    ScaleCH=get(deviceObj.Channel(1), 'Scale');
    case 2
    set(deviceObj.Cursor(1), 'Source', 'channel2');
    ScaleCH=get(deviceObj.Channel(2), 'Scale');
end
handles.ScaleCH=ScaleCH;
guidata( hObject, handles);
% --- Executes during object creation, after setting all properties.
function SelectChannelTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectChannelTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
warndlg('It is better to close the window by clicking the radiobuttons, rather than to iconify the figure.','Instrument Control Warning');


