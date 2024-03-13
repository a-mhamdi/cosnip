----------------------------------------------------------------------------------
-- Company: 
-- Engineer: A. Mhamdi
-- 
-- Create Date:    20:38:41 10/14/2011 
-- Design Name: 
-- Module Name:    Add8Bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add8Bits is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           CIn : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           COut : out  STD_LOGIC);
end Add8Bits;

architecture Behavioral of Add8Bits is

 --Component Declaration
 COMPONENT Add1Bit
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         CIn : IN  std_logic;
         S : OUT  std_logic;
         COut : OUT  std_logic
        );
    END COMPONENT;
	 
Signal Temp : Std_Logic_Vector (7 DownTo 0);
Signal Var : Std_Logic_Vector (8 DownTo 0);
begin
Var(0) <= CIn;
--Instantiation Unit Under Test
LoopGen: For i In 0 To 7 Generate
UUT: Add1Bit Port Map(A(i), B(i), Var(i), Temp(i), Var(i+1));
End Generate;
S <= Temp;
COut <= Var(8);
end Behavioral;

