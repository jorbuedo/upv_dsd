----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Sat Mar  9 22:47:29 CET 2013 
-- Design Name: 
-- Module Name:      ROM_8_16b - DataFlow
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
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ROM_8_16b is
	Port ( 
		A		: in	STD_LOGIC_VECTOR(17 downto 0);
		Q		: out	STD_LOGIC_VECTOR(14 downto 0);
		Q15A1	: inout	STD_LOGIC;
		BHE		: in	STD_LOGIC;
		CE		: in	STD_LOGIC;
		OE		: in	STD_LOGIC
	);
end ROM_8_16b;

architecture DataFlow of ROM_8_16b is
	type matrix is array (262144 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
	constant memory : matrix := (0 => x"ABCD", others => (others => '0'));
	signal word	: STD_LOGIC_VECTOR(15 downto 0);
	signal byte	: STD_LOGIC_VECTOR(7 downto 0);
	signal sel	: STD_LOGIC_VECTOR(2 downto 0);
begin
	word <= memory(conv_integer(A));
	byte <= word(15 downto 8) when Q15A1 = '1' else word(7 downto 0);
	sel <= CE & OE & BHE;

	with sel select
		Q <=	word(14 downto 0)	when "001",
    			"ZZZZZZZ" & byte	when "000",
				(others => 'Z')		when others;
	Q15A1 <= word(0) when sel = "001" else 'Z';
end DataFlow;

