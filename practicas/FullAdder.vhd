----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Sun Mar  3 21:34:04 CET 2013 
-- Design Name: 
-- Module Name:      FullAdder - Structural
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

entity FullAdder is
    Port ( 
        a_i : in  STD_LOGIC;	-- First input bit to add
        b_i : in  STD_LOGIC;	-- Second input bit to add
        c_i : in  STD_LOGIC;	-- Carry in
        c_o : out  STD_LOGIC;	-- Carry out
        s_o : out  STD_LOGIC	-- Solution
    );
end FullAdder;

architecture Structural of FullAdder is

component HalfAdder is
   Port ( 
         a_i : in  STD_LOGIC;
         b_i : in  STD_LOGIC;
         c_o : out  STD_LOGIC;
         s_o : out  STD_LOGIC);
end component;
-- HalfAdder 0 carry, HalfAdder 0 solution ...
signal ha0c, ha0s, ha1c, ha1s	: STD_LOGIC;

begin
HalfAdder_0 : HalfAdder
   port map (
         a_i  => a_i,
         b_i  => b_i,
         c_o  => ha0c,
         s_o  => ha0s );

HalfAdder_1 : HalfAdder
   port map (
         a_i  => ha0s,
         b_i  => c_i,
         c_o  => ha1c,
         s_o  => s_o );
c_o <= ha0c or ha1c;

end Structural;

