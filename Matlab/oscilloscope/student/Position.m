function varargout = Position(varargin)
% POSITION M-file for Position.fig
%      POSITION, by itself, creates a new POSITION or raises the existing
%      singleton*.
%
%      H = POSITION returns the handle to a new POSITION or the handle to
%      the existing singleton*.
%
%      POSITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POSITION.M with the given input arguments.
%
%      POSITION('Property','Value',...) creates a new POSITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Position_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Position_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Position

% Last Modified by GUIDE v2.5 30-Mar-2010 23:44:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Position_OpeningFcn, ...
                   'gui_OutputFcn',  @Position_OutputFcn, ...
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


% --- Executes just before Position is made visible.
function Position_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Position (see VARARGIN)

% Choose default command line output for Position
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Position wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% changeIcon
%{
jFrame=get(handles.figure1,'javaframe');
jIcon=javax.swing.ImageIcon('tek_tds1002.gif');
jFrame.setFigureIcon(jIcon);
%}
% --- Outputs from this function are returned to the command line.
function varargout = Position_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function PosEditTag_Callback(hObject, eventdata, handles)
% hObject    handle to PosEditTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PosEditTag as text
%        str2double(get(hObject,'String')) returns contents of PosEditTag as a double
PosEditTag=str2double(get(hObject, 'String'));
handles.PosCH=PosEditTag;
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function PosEditTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PosEditTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in SetTag.
function SetTag_Callback(hObject, eventdata, handles)
% hObject    handle to SetTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObj;
PosCH=handles.PosCH;
popup_sel_index = get(handles.SelectChannelTag, 'Value');
switch popup_sel_index
    case 1
        set(deviceObj.Channel(1), 'Position', PosCH);
    case 2
        set(deviceObj.Channel(2), 'Position', PosCH);
end


% --- Executes on selection change in SelectChannelTag.
function SelectChannelTag_Callback(hObject, eventdata, handles)
% hObject    handle to SelectChannelTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns SelectChannelTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectChannelTag


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


