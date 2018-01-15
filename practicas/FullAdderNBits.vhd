----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Sun Mar  3 21:54:37 CET 2013 
-- Design Name: 
-- Module Name:      FullAdderNBits - Structural
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

entity FullAdderNBits is
	generic(SIZE : natural := 32);
    Port ( 
        a_i		: in	STD_LOGIC_VECTOR(SIZE-1 downto 0);
        b_i		: in	STD_LOGIC_VECTOR(SIZE-1 downto 0);
        c_i		: in	STD_LOGIC;
        c_o		: out	STD_LOGIC;
        s_o		: out	STD_LOGIC_VECTOR(SIZE-1 downto 0)
    );
end FullAdderNBits;

architecture Behavioral of FullAdderNBits is
	signal result	: STD_LOGIC_VECTOR(SIZE-1 downto 0);
begin
	process(a_i, b_i, c_i)
		variable carry : STD_LOGIC;
	begin
		carry := c_i;
		for i in 0 to SIZE-1 loop
			result(i) <= a_i(i) xor b_i(i) xor carry;
			carry := (a_i(i) and b_i(i)) or (a_i(i) and carry) or (b_i(i) and carry);
		end loop;
		c_o <= carry;
	end process;
	s_o <= result;
end Behavioral;

architecture Structural of FullAdderNBits is

component FullAdder is
    Port ( 
        a_i : in  STD_LOGIC;
        b_i : in  STD_LOGIC;
        c_i : in  STD_LOGIC;
        c_o : out  STD_LOGIC;
        s_o : out  STD_LOGIC
    );
end component;

signal carry	: STD_LOGIC_VECTOR(SIZE downto 0);

begin
	carry(0) <= c_i;
	c_o <= carry(SIZE);

	gen : for i in 0 to SIZE-1 generate
	begin
	FullAdder_0 : FullAdder
	    port map (
	        a_i  => a_i(i),
	        b_i  => b_i(i),
	        c_i  => carry(i),
	        c_o  => carry(i+1),
	        s_o  => s_o(i)
	    );
	end generate;	
end Structural;

