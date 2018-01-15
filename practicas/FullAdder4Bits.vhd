----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Mon Mar  4 18:36:32 CET 2013 
-- Design Name: 
-- Module Name:      FullAdder4Bits - Structural
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

entity FullAdder4Bits is
    Port ( 
        a_i	: in  STD_LOGIC_VECTOR(3 downto 0);
        b_i	: in  STD_LOGIC_VECTOR(3 downto 0);
        s_o	: out STD_LOGIC_VECTOR(4 downto 0)
    );
end FullAdder4Bits;

architecture Structural of FullAdder4Bits is
component FullAdderNBits is
	generic(SIZE : natural := 32);
    Port ( 
        a_i : in  STD_LOGIC_VECTOR(SIZE-1 downto 0);
        b_i : in  STD_LOGIC_VECTOR(SIZE-1 downto 0);
        c_i : in  STD_LOGIC;
        c_o : out  STD_LOGIC;
        s_o : out  STD_LOGIC_VECTOR(SIZE-1 downto 0)
    );
end component;
	signal carry	: STD_LOGIC;
	signal result	: STD_LOGIC_VECTOR(3 downto 0);
begin
FullAdderNBits_0 : FullAdderNBits
	generic map (SIZE  => 4)
    port map (
        a_i  => a_i,
        b_i  => b_i,
        c_i  => '0',
        c_o  => carry,
        s_o  => result
    );
	s_o <= carry & result;

end Structural;

