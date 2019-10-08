function varargout = TrainingGUI(varargin)
% TRAININGGUI MATLAB code for TrainingGUI.fig
%      TRAININGGUI, by itself, creates a new TRAININGGUI or raises the existing
%      singleton*.
%
%      H = TRAININGGUI returns the handle to a new TRAININGGUI or the handle to
%      the existing singleton*.
%
%      TRAININGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAININGGUI.M with the given input arguments.
%
%      TRAININGGUI('Property','Value',...) creates a new TRAININGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TrainingGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TrainingGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TrainingGUI

% Last Modified by GUIDE v2.5 25-Mar-2014 20:12:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TrainingGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TrainingGUI_OutputFcn, ...
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


% --- Executes just before TrainingGUI is made visible.
function TrainingGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TrainingGUI (see VARARGIN)
%%%%%%%%%%%%%%%%%%%
if strcmp(get(hObject,'Visible'),'off')
    load IsetLogo;
    axes(handles.IsetLogoAxes);
    cla;
    image(IsetLogo);
    % image(cdata);
    % colormap(map);
    % grid on;
    set(handles.IsetLogoAxes, 'XTick', []);
    set(handles.IsetLogoAxes, 'YTick', []);
end
%%%%%%%%%%%%%%%%%%%
% Choose default command line output for TrainingGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TrainingGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TrainingGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --------------------------------------------------------------------
function GettingMenuTag_Callback(hObject, eventdata, handles)
% hObject    handle to GettingMenuTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Take a look @ the presentation.', 'Help', 'modal');
% --------------------------------------------------------------------
function AboutMenuTag_Callback(hObject, eventdata, handles)
% hObject    handle to AboutMenuTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('This is My First GUI!!!', 'About', 'modal');
% --------------------------------------------------------------------
function OpenMenuTag_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
implay;
% --------------------------------------------------------------------
function SaveMenuTag_Callback(hObject, eventdata, handles)
% hObject    handle to SaveMenuTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function PrintMenuTag_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ObjVid.FramesPerTrigger = 1;
handles.ObjVid.ReturnedColorspace = 'rgb';
start(handles.ObjVid);
imwrite(getdata(handles.ObjVid), 'C:\Users\MHAMDI\Desktop\MyTest.jpg');
% --------------------------------------------------------------------
function Test_Callback(hObject, eventdata, handles)
% hObject    handle to Test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function GettingToolTag_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to GettingToolTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Take a look @ the presentation.', 'Help', 'modal');
% --- Executes on button press in CamTag.
function CamTag_Callback(hObject, eventdata, handles)
% hObject    handle to CamTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CamTag
Status = get(hObject, 'Value');
if (Status==1)
    axes(handles.CamAxesTag);
    Obj=videoinput('winvideo', 1);
    set(Obj, 'selectedsourcename', 'input1');
% Create an image object for previewing.
    vidRes = get(Obj, 'VideoResolution');
    nBands = get(Obj, 'NumberOfBands');
    HImage = image( zeros(vidRes(2), vidRes(1), nBands) );
    HImage = preview(Obj, HImage);
    set(handles.PrintMenuTag, 'Enable', 'On');
    set(handles.PrintToolTag, 'Enable', 'On');
    set(handles.AcquTag, 'Enable', 'On');
    set(hObject, 'String', 'Stop Preview');
    set(hObject, 'BackgroundColor', 'Red');
    handles.ObjVid = Obj;
    handles.HImage = HImage;
    guidata(hObject, handles);
else
    delete(handles.HImage);
    set(hObject, 'String', 'Preview');
    set(hObject, 'BackgroundColor', 'green');
    set(handles.AcquTag, 'Enable', 'Off');
end
% --- Executes on button press in QuitTag.
function QuitTag_Callback(hObject, eventdata, handles)
% hObject    handle to QuitTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
StatusIm = get(handles.CamTag, 'Value');
if(StatusIm==1)
        warndlg('Press The Button Stop Visualizing','Image Acquisition Warning');
else 
Selection = questdlg(['Do you want to permanently close the GUI?'], ['Quit'], 'Yes','No','No');
    if strcmp(Selection,'No')
    return;
    end
delete(TrainingGUI);
end
% --------------------------------------------------------------------
function PrintToolTag_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to PrintToolTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ObjVid.FramesPerTrigger = 1;
handles.ObjVid.ReturnedColorspace = 'rgb';
start(handles.ObjVid);
imwrite(getdata(handles.ObjVid), 'C:\Users\MHAMDI\Desktop\Test.jpg');
% --------------------------------------------------------------------
function OpenToolTag_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to OpenToolTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
implay;
% --------------------------------------------------------------------
function SaveToolTag_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to SaveToolTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
diskLogger = avifile('C:\Users\MHAMDI\Desktop\TestTestTest.avi', 'Compression', 'None', 'Quality', 75, 'keyframepersec', 2.14, 'FPS', 15);
data = getdata(handles.ObjVid);
numFrames = size(data, 4);
for ii = 1:numFrames
    diskLogger = addframe(diskLogger, data(:,:,:,ii));
end
diskLogger = close(diskLogger);
% --- Executes on button press in ExportTag.
function ExportTag_Callback(hObject, eventdata, handles)
% hObject    handle to ExportTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in AcquTag.
function AcquTag_Callback(hObject, eventdata, handles)
% hObject    handle to AcquTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of AcquTag
Status = get(hObject, 'Value');
if (Status == 1)
    handles.ObjVid.FramesPerTrigger = 150;
    handles.ObjVid.ReturnedColorspace = 'rgb';
    set(hObject, 'String', 'Stop Acquisition');
    % handles.ObjVid.LoggingMode = 'disk';
    % MyDiskLogger = avifile('C:\Users\MHAMDI\Desktop\Test.avi', 'Compression', 'None', 'Quality', 75, 'keyframepersec', 2.14, 'FPS', 15);
    % handles.ObjVid.MyDiskLogger = MyDiskLogger;
    start(handles.ObjVid);
else
    set(hObject, 'String', 'Start Acquisition');
    % MyDiskLogger = close(handles.ObjVid.MyDiskLogger);
    % handles.ObjVid.MyDiskLogger = MyDiskLogger;
    set(handles.SaveMenuTag, 'Enable', 'On');
    set(handles.SaveToolTag, 'Enable', 'On');
    stop(handles.ObjVid);
end
% --------------------------------------------------------------------
function FileMenuTag_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenuTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function HelpMenuTag_Callback(hObject, eventdata, handles)
% hObject    handle to HelpMenuTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
