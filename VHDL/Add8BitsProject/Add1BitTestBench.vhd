--------------------------------------------------------------------------------
-- Company: 
-- Engineer: A. Mhamdi
--
-- Create Date:   20:33:19 10/14/2011
-- Design Name:   
-- Module Name:   H:/CoursESPRIT/Programme/4TEL/VHDL/TutorialVHDLXilinxISE/Add8BitsProject/Add1BitTestBench.vhd
-- Project Name:  Add8BitsProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Add1Bit
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Add1BitTestBench IS
END Add1BitTestBench;
 
ARCHITECTURE behavior OF Add1BitTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Add1Bit
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         CIn : IN  std_logic;
         S : OUT  std_logic;
         COut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
Signal Temp : Std_Logic_Vector (2 DownTo 0):="000";

 	--Outputs
   signal S : std_logic;
   signal COut : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Add1Bit PORT MAP (
          A => Temp(0),
          B => Temp(1),
          CIn => Temp(2),
          S => S,
          COut => COut
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin
Temp <= "000";
wait for 100 ns;	
Temp <= "001";
wait for 100 ns;	
Temp <= "010";
wait for 100 ns;	
Temp <= "011";
wait for 100 ns;	
Temp <= "100";
wait for 100 ns;	
Temp <= "101";
wait for 100 ns;	
Temp <= "110";
wait for 100 ns;	
Temp <= "111";
   wait;
   end process;

END;
