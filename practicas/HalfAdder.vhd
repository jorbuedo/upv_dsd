----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Wed Feb 27 11:30:09 CET 2013 
-- Design Name: 
-- Module Name:      HalfAdder - Behavioural
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
--use IEEE.NUMERIC_STD.ALL;

entity HalfAdder is
   Port ( 
         a_i : in  STD_LOGIC;	-- First input bit to add
         b_i : in  STD_LOGIC;	-- Second input bit to add
         c_o : out  STD_LOGIC;	-- Carry
         s_o : out  STD_LOGIC);	-- Solution
end HalfAdder;

architecture Behavioural of HalfAdder is

begin
	
	process(a_i, b_i)
	begin
		s_o	<= a_i xor b_i;
		c_o	<= a_i and b_i;
	end process;
end Behavioural;

