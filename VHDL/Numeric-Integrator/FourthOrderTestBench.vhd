--------------------------------------------------------------------------------
-- Company: 
-- Engineer: A. Mhamdi
--
-- Create Date:   00:34:47 10/07/2012
-- Design Name:   
-- Module Name:   M:/Esprit/CoursESPRIT/Programme/4TEL/MPVHDL2012/FourthOrderFilter/NumericIntegrator/FourthOrderTestBench.vhd
-- Project Name:  NumericIntegrator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourthOrderFilter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Library IEEE_Proposed;
Use IEEE_Proposed.Fixed_Pkg.All;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FourthOrderTestBench IS
END FourthOrderTestBench;
 
ARCHITECTURE Behavior OF FourthOrderTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourthOrderFilter
    Port ( 
				Clk 	: 	In  Std_Logic;
				DataIn 		: 	In  SFixed (3 DownTo -2);
				Yn 		: 	Out  SFixed (10 DownTo -4));
    END COMPONENT;
    

   --Inputs
   Signal Clk : std_logic := '0';
   Signal DataIn: SFixed (3 DownTo -2):= (others => '0');

 	--Outputs
   Signal Yn : SFixed (10 DownTo -4);

   -- Clock period definitions
   Constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   UUT: FourthOrderFilter PORT MAP (
          Clk => Clk,
          DataIn => DataIn,
          Yn => Yn
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		Wait for Clk_period/2;
		Clk <= '1';
		Wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   Stim_Proc: Process
   Begin
		  -- Wait For 0.25 us;
		DataIn <= To_SFixed(2, 3, -2);
      Wait for 10 ns;	
		DataIn <= To_SFixed(1, 3, -2);
      Wait for 170 ns;
		DataIn <= To_SFixed(7.75, 3, -2);
      Wait for 200 ns;
		DataIn <= To_SFixed(3.25, 3, -2);
      Wait for 355 ns;
		DataIn <= To_SFixed(2.5, 3, -2);
      Wait for 145 ns;	
		DataIn <= To_SFixed(-0.5, 3, -2);
      Wait for 85 ns;
		DataIn <= To_SFixed(-8.75, 3, -2);
      Wait for 145 ns;
		DataIn <= To_SFixed(-1, 3, -2);
      Wait for 235 ns;
      Wait;
   end Process;

END;
