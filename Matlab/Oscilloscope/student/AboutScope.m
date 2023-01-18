function varargout = AboutScope(varargin)
% ABOUTSCOPE M-file for AboutScope.fig
%      ABOUTSCOPE, by itself, creates a new ABOUTSCOPE or raises the existing
%      singleton*.
%
%      H = ABOUTSCOPE returns the handle to a new ABOUTSCOPE or the handle to
%      the existing singleton*.
%
%      ABOUTSCOPE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUTSCOPE.M with the given input arguments.
%
%      ABOUTSCOPE('Property','Value',...) creates a new ABOUTSCOPE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AboutScope_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AboutScope_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AboutScope

% Last Modified by GUIDE v2.5 20-Mar-2010 12:18:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AboutScope_OpeningFcn, ...
                   'gui_OutputFcn',  @AboutScope_OutputFcn, ...
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


% --- Executes just before AboutScope is made visible.
function AboutScope_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AboutScope (see VARARGIN)

% Choose default command line output for AboutScope
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AboutScope wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% changeIcon
%{
jFrame=get(handles.figure1,'javaframe');
jIcon=javax.swing.ImageIcon('tek_tds1002.gif');
jFrame.setFigureIcon(jIcon);
%}
% --- Outputs from this function are returned to the command line.
function varargout = AboutScope_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
