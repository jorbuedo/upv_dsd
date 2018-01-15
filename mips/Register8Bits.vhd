----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 23:03:58 CEST 2013 
-- Design Name: 
-- Module Name:		Register8Bits - Behavioral
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

entity Register8Bits is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		ReadData	: in	STD_LOGIC_VECTOR(7 downto 0);
		WriteData	: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end Register8Bits;

architecture Behavioral of Register8Bits is
begin
	process(Clk, Rst)
	begin
		if(Rst = '1') then
			WriteData <= (others => '0');
		elsif(Clk'event and Clk = '1') then
			WriteData <= ReadData;
		end if;
	end process;
end Behavioral;

