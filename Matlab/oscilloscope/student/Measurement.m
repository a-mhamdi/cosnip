function varargout = Measurement(varargin)
% MEASUREMENT M-file for Measurement.fig
%      MEASUREMENT, by itself, creates a new MEASUREMENT or raises the existing
%      singleton*.
%
%      H = MEASUREMENT returns the handle to a new MEASUREMENT or the handle to
%      the existing singleton*.
%
%      MEASUREMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEASUREMENT.M with the given input arguments.
%
%      MEASUREMENT('Property','Value',...) creates a new MEASUREMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Measurement_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Measurement_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Measurement

% Last Modified by GUIDE v2.5 31-Mar-2010 00:36:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Measurement_OpeningFcn, ...
                   'gui_OutputFcn',  @Measurement_OutputFcn, ...
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


% --- Executes just before Measurement is made visible.
function Measurement_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Measurement (see VARARGIN)

% Choose default command line output for Measurement
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Measurement wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% changeIcon
%{
jFrame=get(handles.figure1,'javaframe');
jIcon=javax.swing.ImageIcon('tek_tds1002.gif');
jFrame.setFigureIcon(jIcon);
%}

% --- Outputs from this function are returned to the command line.
function varargout = Measurement_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in SelectSourceTag.
function SelectSourceTag_Callback(hObject, eventdata, handles)
% hObject    handle to SelectSourceTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns SelectSourceTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SelectSourceTag
global deviceObj;
PopIndex=get(handles.SelectSourceTag, 'Value');
switch PopIndex
    case 1
        set(deviceObj.Measurement, 'Source', 'channel1');
    case 2
        set(deviceObj.Measurement, 'Source', 'channel2');
end
% --- Executes during object creation, after setting all properties.
function SelectSourceTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SelectSourceTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in MeasPropertyTag.
function MeasPropertyTag_Callback(hObject, eventdata, handles)
% hObject    handle to MeasPropertyTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = get(hObject,'String') returns MeasPropertyTag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MeasPropertyTag
global deviceObj;
spc=' ';
PopIndexPlace=get(handles.MeasPlaceTag, 'Value');
PopIndexProper=get(handles.MeasPropertyTag, 'Value');
if (PopIndexPlace==1)
switch PopIndexProper
    case 1
        set(deviceObj.Measurement(1), 'MeasurementType', 'none');
    case 2
        set(deviceObj.Measurement(1), 'MeasurementType', 'frequency');
        set(deviceObj.Measurement(5), 'MeasurementType', 'frequency');
        Freq=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Freq=num2str(Freq);
        Msg1=strcat('Your Signal Frequency Is: ', Freq, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 3
        set(deviceObj.Measurement(1), 'MeasurementType', 'period');
        set(deviceObj.Measurement(5), 'MeasurementType', 'period');
        Period=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Period=num2str(Period);
        Msg1=strcat('Your Signal Period Is: ', Period, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 4
        set(deviceObj.Measurement(1), 'MeasurementType', 'peak2peak');
        set(deviceObj.Measurement(5), 'MeasurementType', 'peak2peak');
        peak2peak=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        peak2peak=num2str(peak2peak);
        Msg1=strcat('Peak To Peak Value Is: ', peak2peak, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 5
        set(deviceObj.Measurement(1), 'MeasurementType', 'crms');
        set(deviceObj.Measurement(5), 'MeasurementType', 'crms');
        crms=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        crms=num2str(crms);
        Msg1=strcat('CRMS Is: ', crms, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 6
        set(deviceObj.Measurement(1), 'MeasurementType', 'mean');
        set(deviceObj.Measurement(5), 'MeasurementType', 'mean');
        mean=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        mean=num2str(mean);
        Msg1=strcat('Mean Value Is: ', mean, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 7
        set(deviceObj.Measurement(1), 'MeasurementType', 'minimum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'minimum');
        minimum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        minimum=num2str(minimum);
        Msg1=strcat('Your Signal Minimum Amplitude Is: ', minimum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 8
        set(deviceObj.Measurement(1), 'MeasurementType', 'maximum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'maximum');
        maximum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        maximum=num2str(maximum);
        Msg1=strcat('Your Signal Maximum Amplitude Is: ', maximum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 9
        set(deviceObj.Measurement(1), 'MeasurementType', 'positivewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'positivewidth');
        positivewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        positivewidth=num2str(positivewidth);
        Msg1=strcat('Positive Width Is: ', positivewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 10
        set(deviceObj.Measurement(1), 'MeasurementType', 'negativewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'negativewidth');
        negativewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        negativewidth=num2str(negativewidth);
        Msg1=strcat('Negative Width Is: ', negativewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
end
else if (PopIndexPlace==2)
    switch PopIndexProper
    case 1
        set(deviceObj.Measurement(2), 'MeasurementType', 'none');
    case 2
        set(deviceObj.Measurement(2), 'MeasurementType', 'frequency');
        set(deviceObj.Measurement(5), 'MeasurementType', 'frequency');
        Freq=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Freq=num2str(Freq);
        Msg1=strcat('Your Signal Frequency Is: ', Freq, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 3
        set(deviceObj.Measurement(2), 'MeasurementType', 'period');
        set(deviceObj.Measurement(5), 'MeasurementType', 'period');
        Period=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Period=num2str(Period);
        Msg1=strcat('Your Signal Period Is: ', Period, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 4
        set(deviceObj.Measurement(2), 'MeasurementType', 'peak2peak');
        set(deviceObj.Measurement(5), 'MeasurementType', 'peak2peak');
        peak2peak=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        peak2peak=num2str(peak2peak);
        Msg1=strcat('Peak To Peak Value Is: ', peak2peak, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 5
        set(deviceObj.Measurement(2), 'MeasurementType', 'crms');
        set(deviceObj.Measurement(5), 'MeasurementType', 'crms');
        crms=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        crms=num2str(crms);
        Msg1=strcat('CRMS Is: ', crms, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 6
        set(deviceObj.Measurement(2), 'MeasurementType', 'mean');
        set(deviceObj.Measurement(5), 'MeasurementType', 'mean');
        mean=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        mean=num2str(mean);
        Msg1=strcat('Mean Value Is: ', mean, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 7
        set(deviceObj.Measurement(2), 'MeasurementType', 'minimum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'minimum');
        minimum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        minimum=num2str(minimum);
        Msg1=strcat('Your Signal Minimum Amplitude Is: ', minimum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 8
        set(deviceObj.Measurement(2), 'MeasurementType', 'maximum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'maximum');
        maximum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        maximum=num2str(maximum);
        Msg1=strcat('Your Signal Maximum Amplitude Is: ', maximum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 9
        set(deviceObj.Measurement(2), 'MeasurementType', 'positivewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'positivewidth');
        positivewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        positivewidth=num2str(positivewidth);
        Msg1=strcat('Positive Width Is: ', positivewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 10
        set(deviceObj.Measurement(2), 'MeasurementType', 'negativewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'negativewidth');
        negativewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        negativewidth=num2str(negativewidth);
        Msg1=strcat('Negative Width Is: ', negativewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
    end
    else if (PopIndexPlace==3)
switch PopIndexProper
    case 1
        set(deviceObj.Measurement(3), 'MeasurementType', 'none');
    case 2
        set(deviceObj.Measurement(3), 'MeasurementType', 'frequency');
        set(deviceObj.Measurement(5), 'MeasurementType', 'frequency');
        Freq=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Freq=num2str(Freq);
        Msg1=strcat('Your Signal Frequency Is: ', Freq, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 3
        set(deviceObj.Measurement(3), 'MeasurementType', 'period');
        set(deviceObj.Measurement(5), 'MeasurementType', 'period');
        Period=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Period=num2str(Period);
        Msg1=strcat('Your Signal Period Is: ', Period, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 4
        set(deviceObj.Measurement(3), 'MeasurementType', 'peak2peak');
        set(deviceObj.Measurement(5), 'MeasurementType', 'peak2peak');
        peak2peak=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        peak2peak=num2str(peak2peak);
        Msg1=strcat('Peak To Peak Value Is: ', peak2peak, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 5
        set(deviceObj.Measurement(3), 'MeasurementType', 'crms');
        set(deviceObj.Measurement(5), 'MeasurementType', 'crms');
        crms=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        crms=num2str(crms);
        Msg1=strcat('CRMS Is: ', crms, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 6
        set(deviceObj.Measurement(3), 'MeasurementType', 'mean');
        set(deviceObj.Measurement(5), 'MeasurementType', 'mean');
        mean=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        mean=num2str(mean);
        Msg1=strcat('Mean Value Is: ', mean, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 7
        set(deviceObj.Measurement(3), 'MeasurementType', 'minimum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'minimum');
        minimum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        minimum=num2str(minimum);
        Msg1=strcat('Your Signal Minimum Amplitude Is: ', minimum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 8
        set(deviceObj.Measurement(3), 'MeasurementType', 'maximum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'maximum');
        maximum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        maximum=num2str(maximum);
        Msg1=strcat('Your Signal Maximum Amplitude Is: ', maximum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 9
        set(deviceObj.Measurement(3), 'MeasurementType', 'positivewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'positivewidth');
        positivewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        positivewidth=num2str(positivewidth);
        Msg1=strcat('Positive Width Is: ', positivewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 10
        set(deviceObj.Measurement(3), 'MeasurementType', 'negativewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'negativewidth');
        negativewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        negativewidth=num2str(negativewidth);
        Msg1=strcat('Negative Width Is: ', negativewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
end
        else if (PopIndexPlace==4)         
        switch PopIndexProper
    case 1
        set(deviceObj.Measurement(4), 'MeasurementType', 'none');
    case 2
        set(deviceObj.Measurement(4), 'MeasurementType', 'frequency');
        set(deviceObj.Measurement(5), 'MeasurementType', 'frequency');
        Freq=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Freq=num2str(Freq);
        Msg1=strcat('Your Signal Frequency Is: ', Freq, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 3
        set(deviceObj.Measurement(4), 'MeasurementType', 'period');
        set(deviceObj.Measurement(5), 'MeasurementType', 'period');
        Period=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Period=num2str(Period);
        Msg1=strcat('Your Signal Period Is: ', Period, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 4
        set(deviceObj.Measurement(4), 'MeasurementType', 'peak2peak');
        set(deviceObj.Measurement(5), 'MeasurementType', 'peak2peak');     
        peak2peak=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        peak2peak=num2str(peak2peak);
        Msg1=strcat('Peak To Peak Value Is: ', peak2peak, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 5
        set(deviceObj.Measurement(4), 'MeasurementType', 'crms');
        set(deviceObj.Measurement(5), 'MeasurementType', 'crms');
        crms=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        crms=num2str(crms);
        Msg1=strcat('CRMS Is: ', crms, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 6
        set(deviceObj.Measurement(4), 'MeasurementType', 'mean');
        set(deviceObj.Measurement(5), 'MeasurementType', 'mean');
        mean=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        mean=num2str(mean);
        Msg1=strcat('Mean Value Is: ', mean, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 7
        set(deviceObj.Measurement(4), 'MeasurementType', 'minimum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'minimum');
        minimum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        minimum=num2str(minimum);
        Msg1=strcat('Your Signal Minimum Amplitude Is: ', minimum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 8
        set(deviceObj.Measurement(4), 'MeasurementType', 'maximum');
        set(deviceObj.Measurement(5), 'MeasurementType', 'maximum');
        maximum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        maximum=num2str(maximum);
        Msg1=strcat('Your Signal Maximum Amplitude Is: ', maximum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 9
        set(deviceObj.Measurement(4), 'MeasurementType', 'positivewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'positivewidth');
        positivewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        positivewidth=num2str(positivewidth);
        Msg1=strcat('Positive Width Is: ', positivewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 10
        set(deviceObj.Measurement(4), 'MeasurementType', 'negativewidth');
        set(deviceObj.Measurement(5), 'MeasurementType', 'negativewidth');
        negativewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        negativewidth=num2str(negativewidth);
        Msg1=strcat('Negative Width Is: ', negativewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
        end
        else if (PopIndexPlace==5)
        switch PopIndexProper
    case 1
        set(deviceObj.Measurement(5), 'MeasurementType', 'none');
    case 2
        set(deviceObj.Measurement(5), 'MeasurementType', 'frequency');
        Freq=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Freq=num2str(Freq);
        Msg1=strcat('Your Signal Frequency Is: ', Freq, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 3
        set(deviceObj.Measurement(5), 'MeasurementType', 'period');
        Period=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        Period=num2str(Period);
        Msg1=strcat('Your Signal Period Is: ', Period, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 4
        set(deviceObj.Measurement(5), 'MeasurementType', 'peak2peak');
        peak2peak=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        peak2peak=num2str(peak2peak);
        Msg1=strcat('Peak To Peak Value Is: ', peak2peak, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 5
        set(deviceObj.Measurement(5), 'MeasurementType', 'crms');
        crms=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        crms=num2str(crms);
        Msg1=strcat('CRMS Is: ', crms, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 6
        set(deviceObj.Measurement(5), 'MeasurementType', 'mean');
        mean=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        mean=num2str(mean);
        Msg1=strcat('Mean Value Is: ', mean, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 7
        set(deviceObj.Measurement(5), 'MeasurementType', 'minimum');
        minimum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        minimum=num2str(minimum);
        Msg1=strcat('Your Signal Minimum Amplitude Is: ', minimum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 8
        set(deviceObj.Measurement(5), 'MeasurementType', 'maximum');
        maximum=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        maximum=num2str(maximum);
        Msg1=strcat('Your Signal Maximum Amplitude Is: ', maximum, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 9
        set(deviceObj.Measurement(5), 'MeasurementType', 'positivewidth');
        positivewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        positivewidth=num2str(positivewidth);
        Msg1=strcat('Positive Width Is: ', positivewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
    case 10
        set(deviceObj.Measurement(5), 'MeasurementType', 'negativewidth');
        negativewidth=get(deviceObj.Measurement(5), 'Value');
        Units=get(deviceObj.Measurement(5), 'Units');
        negativewidth=num2str(negativewidth);
        Msg1=strcat('Negative Width Is: ', negativewidth, spc, Units);
        set(handles.GetText, 'String', Msg1);
        end
                end
            end
        end
    end
end
