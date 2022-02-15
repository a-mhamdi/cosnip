function varargout = ImportWizard(varargin)
% IMPORTWIZARD M-file for ImportWizard.fig
%      IMPORTWIZARD, by itself, creates a new IMPORTWIZARD or raises the existing
%      singleton*.
%
%      H = IMPORTWIZARD returns the handle to a new IMPORTWIZARD or the handle to
%      the existing singleton*.
%
%      IMPORTWIZARD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMPORTWIZARD.M with the given input arguments.
%
%      IMPORTWIZARD('Property','Value',...) creates a new IMPORTWIZARD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImportWizard_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImportWizard_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImportWizard

% Last Modified by GUIDE v2.5 17-Apr-2010 00:12:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImportWizard_OpeningFcn, ...
                   'gui_OutputFcn',  @ImportWizard_OutputFcn, ...
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

% --- Executes just before ImportWizard is made visible.
function ImportWizard_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImportWizard (see VARARGIN)

% Choose default command line output for ImportWizard
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
load ImportHelp.mat;
axes(handles.AxesImportTag);
imagesc(ImportHelp);
% UIWAIT makes ImportWizard wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = ImportWizard_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function ImportMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to ImportMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%fileToRead = uigetfile('*.mat');
DataImport=uiimport();
%if ~isequal(fileToRead, 0)
    %DataImport=uiimport(fileToRead);
    %DataImport = load('-mat', fileToRead);
if ~isempty(DataImport)    
    %DataImport=load(fileToRead);
    handles.Data=DataImport;
    guidata(hObject, handles);
    set(handles.ViewGraphTag, 'Visible', 'on');
    set(handles.ClearGraphTag, 'Visible', 'on');
    set(handles.ValidateGraphTag, 'Visible', 'on');
end
% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)
% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)
% --- Executes on button press in ViewGraphTag.
function ViewGraphTag_Callback(hObject, eventdata, handles)
% hObject    handle to ViewGraphTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.AxesImportTag);
cla(handles.AxesImportTag);
Data=handles.Data;
Time=Data.ans(1,:);
Amplitude=Data.ans(2,:);
plot(Time', Amplitude');
grid on;
% --- Executes on button press in ClearGraphTag.
function ClearGraphTag_Callback(hObject, eventdata, handles)
% hObject    handle to ClearGraphTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.AxesImportTag);
cla(handles.AxesImportTag, 'reset');
grid on;
% --- Executes on button press in ValidateGraphTag.
function ValidateGraphTag_Callback(hObject, eventdata, handles)
% hObject    handle to ValidateGraphTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global deviceObject;
Data=handles.Data;
Time=Data.ans(1,:);
Amplitude=Data.ans(2,:);
% Execute device object function(s).
groupObj = get(deviceObject, 'Arbitrarywaveform');
groupObj = groupObj(1);
%invoke(groupObj, 'clear', 'excit');
invoke(groupObj, 'setwaveform', 'excit');
groupObj = get(deviceObject, 'Arbitrarywaveform');
invoke(groupObj, 'create', 'excit', Amplitude);
% Configure property value(s).
n=length(Amplitude);
Freq=(Time(n)-Time(1))^-1;
set(deviceObject.Arbitrarywaveform(1), 'Frequency', Freq);
set(deviceObject, 'Waveform', 'user');
set(deviceObject.Arbitrarywaveform(1), 'CurrentWaveformName', 'excit');


