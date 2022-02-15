function varargout = VBar(varargin)
% VBAR M-file for VBar.fig
%      VBAR, by itself, creates a new VBAR or raises the existing
%      singleton*.
%
%      H = VBAR returns the handle to a new VBAR or the handle to
%      the existing singleton*.
%
%      VBAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VBAR.M with the given input arguments.
%
%      VBAR('Property','Value',...) creates a new VBAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VBar_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VBar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help VBar
% Last Modified by GUIDE v2.5 08-Apr-2010 01:30:49
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VBar_OpeningFcn, ...
                   'gui_OutputFcn',  @VBar_OutputFcn, ...
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
% --- Executes just before VBar is made visible.
function VBar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VBar (see VARARGIN)
% Choose default command line output for VBar
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% changeIcon
%{
jFrame=get(handles.figure1,'javaframe');
jIcon=javax.swing.ImageIcon('tek_tds1002.gif');
jFrame.setFigureIcon(jIcon);
%}
% UIWAIT makes VBar wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = VBar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in GetVDelta.
function GetVDelta_Callback(hObject, eventdata, handles)
% hObject    handle to GetVDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Query property value(s).
global deviceObj;
VVDelta=get(deviceObj.Cursor(1), 'VerticalBarDelta');
VUDelta=get(deviceObj.Cursor(1), 'VerticalBarUnits');
%handles.Delta.Value=VVDelta;
%handles.Delta.Unit=VUDelta;
VVDelta=num2str(VVDelta);
Temp=strcat(VVDelta, VUDelta);
set(handles.VDeltaText, 'String', Temp);
% --- Executes on button press in GetVPos1.
function GetVPos1_Callback(hObject, eventdata, handles)
% hObject    handle to GetVPos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObj;
VSliderPos1=get(deviceObj.Cursor(1), 'VerticalBarPosition1');
VSliderPos1=num2str(VSliderPos1);
Msg=strcat('Function completed successfully. Your Current Vertical Bar Position is: ', VSliderPos1, ' Seconds');
set(handles.VPos1Text, 'String', Msg);
% --- Executes on slider movement.
function Vslider1_Callback(hObject, eventdata, handles)
% hObject    handle to Vslider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global deviceObj;
VSlider1=get(hObject, 'Value');
TBase=get(deviceObj.Acquisition(1), 'Timebase');
Cursor1=TBase*VSlider1;
set(deviceObj.Cursor(1), 'VerticalBarPosition1', Cursor1);
% --- Executes during object creation, after setting all properties.
function Vslider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vslider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on button press in GetVPos2.
function GetVPos2_Callback(hObject, eventdata, handles)
% hObject    handle to GetVPos2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObj;
VSliderPos2=get(deviceObj.Cursor(1), 'VerticalBarPosition2');
VSliderPos2=num2str(VSliderPos2);
Msg=strcat('Function completed successfully. Your Current Vertical Bar Position is: ', VSliderPos2, ' Seconds');
set(handles.VPos2Text, 'String', Msg);
% --- Executes on slider movement.
function Vslider2_Callback(hObject, eventdata, handles)
% hObject    handle to Vslider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global deviceObj;
VSlider2=get(hObject, 'Value');
TBase=get(deviceObj.Acquisition(1), 'Timebase');
Cursor2=TBase*VSlider2;
set(deviceObj.Cursor(1), 'VerticalBarPosition2', Cursor2);
% --- Executes during object creation, after setting all properties.
function Vslider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vslider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
warndlg('It is better to close the window by clicking the radiobuttons, rather than to iconify the figure.','Instrument Control Warning');


