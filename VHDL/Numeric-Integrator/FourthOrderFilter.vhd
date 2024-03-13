----------------------------------------------------------------------------------
-- Company Esprit:
-- Engineer: A. Mhamdi
-- Create Date:    20:24:01 10/04/2012 
-- Design Name: Finite Impulse Filter (4^{th} Order)
-- Module Name:    FourthOrderFilter - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 3E- XC
-- Tool versions: 
-- Description: 
-- Dependencies: 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: Nothing
----------------------------------------------------------------------------------
Library IEEE;
Use IEEE.Std_Logic_1164.All;
Use IEEE.Std_Logic_Unsigned.All;

Library IEEE_Proposed;
Use IEEE_Proposed.Fixed_Pkg.All;
--
Entity FourthOrderFilter Is
    Port ( 
				Clk 	     : 	In  Std_Logic;
				DataIn 		 : 	In  SFixed (3 DownTo -2);
				Yn 		     : 	Out  SFixed (10 DownTo -4));
End FourthOrderFilter;
--
Architecture Behavioral Of FourthOrderFilter Is
	SubType Quartet Is SFixed (3 DownTo -2);
	Type SampleCoeff Is Array (3 DownTo 0) Of Quartet;
		Constant H : SampleCoeff := (To_SFixed(2, 3, -2), To_SFixed(-1.5, 3, -2), To_SFixed(0.025, 3, -2), To_SFixed(1, 3, -2));
	Type SampleDelay Is Array (3 DownTo 0) Of Quartet;
		Signal Temp : SampleDelay := (To_SFixed(0, 3, -2), To_SFixed(0, 3, -2), To_SFixed(0, 3, -2), To_SFixed(0, 3, -2));
		Signal Aux : SFixed (10 DownTo -4);
		-- Sample Period Specification
		Signal SamplePeriod : Std_Logic_Vector (3 DownTo 0):="1111";--(Others => '0');
		Signal FlagTe : Std_Logic:='0';
Begin
		-- Filtering Input
		Temp(3) <= DataIn;-- Aux <= H(0)*Temp(3)+H(1)*Temp(2)+H(2)*Temp(1)+H(3)*Temp(0);
		Process (Clk)
			Begin
			If Rising_Edge (Clk) Then
			   If SamplePeriod = "1111" Then -- Te = 15 * Clk_Period
				    SamplePeriod <= "0000";
				    FlagTe <= '1';
			   Else 
				 SamplePeriod <= SamplePeriod + 1; 
				 FlagTe <= '0';
			   End If; 
			End If;
		End Process;	
		Process (FlagTe)
			Begin
			If Rising_Edge(FlagTe) Then
				-- Delay Transition
				Temp(0) <= Temp(1);
				Temp(1) <= Temp(2);
				Temp(2) <= Temp(3);
				-- Temp(3) <= DataIn;
				Aux <= H(0)*Temp(3)+H(1)*Temp(2)+H(2)*Temp(1)+H(3)*Temp(0);
   		End If;
		End Process;
		-- Updating Output
		Yn <= Aux;	
End Behavioral;

