%%
nameHostEsprit='localhost';
%%
clear NSTR Y LoopSTR SamplePeriod SamplePeriodSTR i LimY Data X Loop DataTempSTR DataTemp;
pause(1);
SamplePeriodSTR=client(nameHostEsprit, 4015, -1);
SamplePeriod=str2num(SamplePeriodSTR);
NSTR=client(nameHostEsprit, 4015, -1);
NSTRData=client(nameHostEsprit, 4015, -1);
LoopSTR=client(nameHostEsprit, 4015, -1);
Loop=str2num(LoopSTR);
LimData=0;
Y=zeros(1, str2num(NSTR), 'double');
if Loop < 1, 
    Data=client(nameHostEsprit, 4015, -1);
else 
    while 1, 
        DataTempSTR=client(nameHostEsprit, 4015, -1);
    if strcmp(DataTempSTR, 'STOP'),
        break;
    else
        for i=1:length(DataTempSTR),
        Data(LimData+i)=DataTempSTR(i);
        end
        LimData=LimData+length(DataTempSTR);
    end
    end
end
Y=str2num(Data);
X=0:SamplePeriod:(length(Y)-1)*SamplePeriod;
plot(X, Y);
title('CH1:Amplitude Vs Time Student');
xlabel(['Time ', 'S'], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', 'V'], 'fontsize',10,'fontweight','b');
grid on;