----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:41:00 CEST 2013 
-- Design Name: 
-- Module Name:		Registers - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity Registers is
	Port (
		Clk, Rst		: in	STD_LOGIC;
		RegWrite		: in	STD_LOGIC;
		ReadRegister1	: in	STD_LOGIC_VECTOR(4 downto 0);
		ReadRegister2	: in	STD_LOGIC_VECTOR(4 downto 0);
		WriteRegister	: in	STD_LOGIC_VECTOR(4 downto 0);
		WriteData		: in	STD_LOGIC_VECTOR(7 downto 0);
		ReadData1		: out	STD_LOGIC_VECTOR(7 downto 0);
		ReadData2		: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end Registers;

architecture Behavioral of Registers is
	--type Registers_t is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
	type Registers_t is array (0 to 31) of STD_LOGIC_VECTOR(7 downto 0);
	signal Registers_s : Registers_t := (others =>(others => '0'));
begin

	process(ReadRegister1, ReadRegister2)
	begin
		ReadData1 <= Registers_s(to_integer(unsigned(ReadRegister1)));
		ReadData2 <= Registers_s(to_integer(unsigned(ReadRegister2)));
	end process;

	process(Clk, Rst)
	begin
		if(Rst = '1') then
			Registers_s <= (others =>(others => '0'));
		elsif(Clk'event and Clk = '1') then
			if(RegWrite = '1') then
				Registers_s(to_integer(unsigned(WriteRegister))) <= WriteData;
			end if;
		end if;
		Registers_s(0) <= (others => '0');
	end process;
end Behavioral;

