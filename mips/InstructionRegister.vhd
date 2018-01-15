----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:40:28 CEST 2013 
-- Design Name: 
-- Module Name:		InstructionRegister - Behavioral
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

entity InstructionRegister is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		IRWrite		: in	STD_LOGIC_VECTOR(3 downto 0);
		MemData		: in	STD_LOGIC_VECTOR(7 downto 0);
		Instruction	: out	STD_LOGIC_VECTOR(31 downto 0)
	);
end InstructionRegister;

architecture Behavioral of InstructionRegister is
	signal NextInstruction_s : STD_LOGIC_VECTOR(23 downto 0);
begin
	process(Clk, Rst)
	begin
		if(Rst = '1') then
			Instruction <= (others => '0');
			NextInstruction_s <= (others => '0');
		elsif(Clk'event and Clk = '1') then
			case IRWrite is
				when "1000" =>
					NextInstruction_s(23 downto 16) <= MemData;
				when "0100" =>
					NextInstruction_s (15 downto 8) <= MemData;
				when "0010" =>
					NextInstruction_s (7 downto 0)  <= MemData;
				when "0001" =>
					Instruction <= NextInstruction_s & MemData;
				when others => null;
			end case;
		end if;
	end process;
end Behavioral;

