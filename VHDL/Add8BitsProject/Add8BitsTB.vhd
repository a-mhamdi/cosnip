--------------------------------------------------------------------------------
-- Company: 
-- Engineer: A. Mhamdi
--
-- Create Date:   20:43:11 10/14/2011
-- Design Name:   
-- Module Name:   H:/CoursESPRIT/Programme/4TEL/VHDL/TutorialVHDLXilinxISE/Add8BitsProject/Add8BitsTB.vhd
-- Project Name:  Add8BitsProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Add8Bits
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
Use IEEE.Std_Logic_Arith.All;
 Use IEEE.Std_Logic_Unsigned.All;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Add8BitsTB IS
END Add8BitsTB;
 
ARCHITECTURE behavior OF Add8BitsTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Add8Bits
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         CIn : IN  std_logic;
         S : OUT  std_logic_vector(7 downto 0);
         COut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal CIn : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal COut : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Add8Bits PORT MAP (
          A => A,
          B => B,
          CIn => CIn,
          S => S,
          COut => COut
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
A <= Conv_Std_Logic_Vector (25, 8);
B <= Conv_Std_Logic_Vector (125, 8);
CIn <= '0';
Wait For 100 ns;
A <= Conv_Std_Logic_Vector  (80, 8);
B <= Conv_Std_Logic_Vector  (30, 8);
CIn <= '1';
Wait For 100 ns;
A <= Conv_Std_Logic_Vector  (34, 8);
B <= Conv_Std_Logic_Vector  (0, 8);
CIn <= '0';
Wait For 100 ns;
A <= Conv_Std_Logic_Vector  (127, 8);
B <= Conv_Std_Logic_Vector  (128, 8);
CIn <= '0';
Wait For 100 ns;
A <= Conv_Std_Logic_Vector  (127, 8);
B <= Conv_Std_Logic_Vector  (1128, 8);
CIn <= '1';
Wait For 100 ns;
A <= Conv_Std_Logic_Vector  (250, 8);
B <= Conv_Std_Logic_Vector  (250, 8);
CIn <= '0';
 wait;
end process;

END;
