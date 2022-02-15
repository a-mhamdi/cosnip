function varargout = Notice(varargin)
% NOTICE M-file for Notice.fig
%      NOTICE, by itself, creates a new NOTICE or raises the existing
%      singleton*.
%
%      H = NOTICE returns the handle to a new NOTICE or the handle to
%      the existing singleton*.
%
%      NOTICE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NOTICE.M with the given input arguments.
%
%      NOTICE('Property','Value',...) creates a new NOTICE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Notice_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Notice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help Notice
% Last Modified by GUIDE v2.5 28-Mar-2010 18:36:41
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Notice_OpeningFcn, ...
                   'gui_OutputFcn',  @Notice_OutputFcn, ...
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
% --- Executes just before Notice is made visible.
function Notice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Notice (see VARARGIN)
% Choose default command line output for Notice
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Notice wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = Notice_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in ContinueTag.
function ContinueTag_Callback(hObject, eventdata, handles)
% hObject    handle to ContinueTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(Notice);
Scope;
% --- Executes on key press with focus on figure1 and no controls selected.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(get(hObject,'CurrentKey'),'return')
    uiresume(handles.figure1);
    delete(Notice);
    Scope;
end  
