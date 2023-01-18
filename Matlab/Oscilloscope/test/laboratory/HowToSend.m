clear SamplePeriod X i j Y Data ArrayNumb TempConct Temp TryDiv INIT
pause(1);
X=1:0.35:10;
Y=exp(sin(X)+sin(2*X)+sin(3*X));
SamplePeriod=X(2)-X(1);
server(num2str(SamplePeriod), 4015, -1);
server(num2str(length(Y)), 4015, -1);
Data=num2str(Y);
server(num2str(length(Data)), 4015, -1);
ArrayNumb=length(Data)/8192;
server(num2str(ArrayNumb), 4015, -1);
Temp=zeros(1, 8192, 'double');
TempConct=zeros(1, length(Data)-floor(ArrayNumb)*8192, 'double');
if ArrayNumb < 1,
     server(Data, 4015, -1);
else TryDiv=0;
     while  TryDiv < floor(ArrayNumb),
            INIT=(TryDiv*8192);
                for i=1:8192,
                    Temp(i)=Data(INIT+i);
                end
            server(Temp, 4015, -1);
            TryDiv=TryDiv+1;
     end 
     if ArrayNumb > floor(ArrayNumb)
         j=1;
         for i=floor(ArrayNumb)*8192+1:length(Data),
             TempConct(j)=Data(i);
             j=j+1;
         end
         server(TempConct, 4015, -1);
     end
server('STOP', 4015, -1);
end
plot(X, Y);
title('CH1:Amplitude Vs Time Esprit');
xlabel(['Time ', 'S'], 'fontsize',10,'fontweight','b');
ylabel(['Amplitude ', 'V'], 'fontsize',10,'fontweight','b');
grid on;