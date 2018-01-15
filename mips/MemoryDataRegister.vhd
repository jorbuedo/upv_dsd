----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:40:42 CEST 2013 
-- Design Name: 
-- Module Name:		MemoryDataRegister - Behavioral
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

entity MemoryDataRegister is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		MemData		: in	STD_LOGIC_VECTOR(7 downto 0);
		WriteData	: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end MemoryDataRegister;

architecture Behavioral of MemoryDataRegister is

begin
	process(Clk, Rst)
	begin
		if(Rst = '1') then
			WriteData <= (others => '0');
		elsif(Clk'event and Clk = '1') then
			WriteData <= MemData;
		end if;
	end process;
end Behavioral;

