----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:40:06 CEST 2013 
-- Design Name: 
-- Module Name:		PC - Behavioral
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

entity PC is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		PCEn		: in	STD_LOGIC;
		NextPC		: in	STD_LOGIC_VECTOR(7 downto 0);
		Address		: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end PC;

architecture Behavioral of PC is
begin
	process(Clk, Rst)
	begin
		if(Rst = '1') then
			Address <= (others => '0');
		elsif(Clk'event and Clk = '1') then
			if(PCEn = '1') then
				Address <= NextPC;
			end if;
		end if;
	end process;
end Behavioral;

