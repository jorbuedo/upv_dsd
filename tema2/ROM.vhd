----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Wed Mar  6 13:01:54 CET 2013 
-- Design Name: 
-- Module Name:      ROM - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ROM is
    Port ( 
        en		: in  STD_LOGIC;
        address	: in  STD_LOGIC_VECTOR(2 downto 0);
        data	: out  STD_LOGIC_VECTOR(7 downto 0)
    );
end ROM;

architecture Behavioral of ROM is

	type matrix is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
	constant memory : matrix := (
		x"00", -- addr 0
		x"00", -- addr 1
		x"0A", -- addr 2
		x"30", -- addr 3
		x"30", -- addr 4
		x"02", -- addr 5
		x"03", -- addr 6
		x"00" -- addr 7
	);

begin
	data <= memory(conv_integer(address)) when en = '1' else 
		(others => 'Z');
end Behavioral;

