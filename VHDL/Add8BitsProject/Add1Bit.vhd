----------------------------------------------------------------------------------
-- Company: 
-- Engineer: A. Mhamdi
-- 
-- Create Date:    20:31:11 10/14/2011 
-- Design Name: 
-- Module Name:    Add1Bit - Behavioral 
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
--Interface Externe
entity Add1Bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CIn : in  STD_LOGIC;
           S : out  STD_LOGIC;
           COut : out  STD_LOGIC);
end Add1Bit;
--Fonctionnement Interne
architecture Behavioral of Add1Bit is
begin
S <= A Xor B Xor CIn;
COut <= (A And B) Or (A And CIn) Or (B And CIn);
end Behavioral;

