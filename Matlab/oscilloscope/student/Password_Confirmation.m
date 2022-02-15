function Password_Confirmation(str,time_out)
% Demonstrate how to make a password editbox, and nested function 
% callbacks.  This is meant to be called from inside a pcode type file, 
% where an encrypted password is stored.  This GUI is called with the true 
% password passed in, then the user is prompted to enter the password.  If 
% the password the user enters doesn't match the password passed into the 
% GUI, a value of false (0) is returned.  If the user enters the correct 
% password, a value of true (1) is returned.  Also allowed is a timeout
% second argument.
%
%   Example:
%           Password_Confirmation('PassworD') % Then enter PassworD into the GUI.
%
% Suggested exercise:  Consider what would happen if the password was
% stored in the structure S.  Re-code this GUI so that the password is 
% stored in S at the input checking, then figure out how to crack the 
% default password (pretending you don't know it) from the command line by 
% first calling the GUI with no argument.  As the GUI is written now, can  
% the password be compromised from the command line?  Is there a way to  
% safely store the password in the structure S?
% HINTS:  Is the power of nested functions fully used as written here?
%         See the other examples of nested function use.
% Input checking.  Assign a default password or user's string.

% Author:  Matt Fig
% Date:  1/15/2010
N = nargin;

if N==0 
    str = 'ESPRIT';  % Default password, just to test code.
    time_out = 10;  % GUI will stay in uiwait for 1 hour.
elseif N==1 
    time_out = 1;    
elseif N>2
    errordlg('Only a string input and a timeout are allowed', 'See Help');
end

if ~ischar(str)
    str = 'ESPRIT';
end

S.PWG = [];  % This will hold the string the user enters.
S.fh = figure('units','pixels',...
              'position',[450 450 300 60],...
              'menubar','none',...
              'name','Verify Password.',...
              'resize','off',...
              'numbertitle','off',...
              'name','Password_Confirmation');
S.tx = uicontrol('style','text',...
                 'units','pix',...
                 'position',[5 20 80 20],...
                 'string','Password:',...
                 'fontweight','bold',...
                 'horizontalalign','left',...
                 'fontsize',11);
S.ed = uicontrol('style','edit',...
                 'units','pix',...
                 'position',[90 20 200 20],...
                 'backgroundcolor','w',...
                 'callback',{@ed_call,S},...
                 'tooltipstring',' Enter your password here.',...
                 'HorizontalAlign','left',...
                 'KeyPressFcn',{@ed_kpfcn,S});
uicontrol(S.ed);  % Put a blinking cursor in edit box.
uiwait(S.fh,time_out);  % Suspend other execution until return is pressed.

if strcmp(str,S.PWG)
    % Only if the correct password was passed.
    OpeningGUI;
else
    % Incorrect password, or user closed GUI.
    errordlg('Password is incorrect', 'Password Confirmation');
end

if ishandle(S.fh)
    close(S.fh); % In case the user timed out.
end

    function [] = ed_call(varargin)  
        % Closes the dialog when user presses return.
        close(S.fh);
    end

    function [] = ed_kpfcn(varargin)
        [h,S] = varargin{[1,3]};  % Get calling handle and structure.
        % Deals with user input.
        CC = get(S.fh,'currentcharacter');  % The character user entered.
        num = int8(CC);

        if num == 13  % This is a carriage return.
            return;
        end

        E = get(h,'string');  % the string of the edit box.
        % Any key handling other than the return key should be handled
        % in the following if else block.
        if num == 8  % Backspace pressed, update password and screen.
            set(h,'string',E(1:end-1));
            S.PWG = S.PWG(1:end-1);
        elseif num == 127  % The Delete Key: do nothing.
        % On some systems this will delete the symbols.  How would you
        % prevent this?
        elseif ~isempty(num)
            set(h,'string',[E,'*']);  % Print out an asterisk in gui.
            S.PWG = [S.PWG CC];
        end
        % Update the structure.
        % One might think that this is not necessary since these functions
        % are nested within Password_Confirmation.  However this is not true.  When the
        % callback to S.ed was first assigned, the value of S at that
        % instant is what was captured. Note that S.ed does not exist after 
        % the uiwait call in Password_Confirmation, even though it existed right before 
        % the uiwait call!  (Try it to see by placing S.ed after uiwait!)
        set(h,'KeyPressFcn',{@ed_kpfcn,S});  
    end
end