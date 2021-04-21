J = pi*(handles.Dext^4-handles.Dint^4)/32;
I = pi*(handles.Dext^4-handles.Dint^4)/64;
K = 137*(handles.Dext^3-handles.Dint^3)/(handles.P*handles.L2);

Nuance = get(handles.Nuance, 'Value');
if Nuance ==1,
    warndlg('Spécifier la nuance', 'Attention');
    fa = 'Erreur'; Crad = 'Erreur'; Cdeg = 'Erreur'; 
else
    fa = handles.P/(3*handles.Data.E*I)*(handles.L1^3-handles.A^3+handles.L/2*(handles.A+handles.B)^2+4*handles.L2^2*(handles.A+handles.C));
    Crad = 1/1000*handles.P*handles.L^2/(2*fa);
    Cdeg = Crad/57;
end

Ri = (handles.Rap*handles.Dext-handles.Dext)/2;
Cs = 16*handles.P*handles.L2/(pi*(handles.Dext^3-handles.Dint^3))*K;
Cf = 32*handles.P*handles.L1/(pi*handles.Dext^3-handles.Dint^3);
Vm = sqrt(Cf^2+3*Cs^2);