----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:41:18 CEST 2013 
-- Design Name: 
-- Module Name:		ALUControl - Behavioral
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

entity ALUControl is
	Port (
		ALUOp		: in	STD_LOGIC_VECTOR(1 downto 0);
		Funct		: in	STD_LOGIC_VECTOR(5 downto 0);
		ALUControl	: out	STD_LOGIC_VECTOR(2 downto 0)
	);
end ALUControl;

architecture Behavioral of ALUControl is

begin
	process(ALUOp, Funct)
	begin
		case ALUOp is
		-- ADD
			when "00" =>
				ALUControl <= "010";
		-- SUB
			when "01" =>
				ALUControl <= "110";
			when "10" =>
				case Funct is
		-- ADD
					when "100000" =>
						ALUControl <= "010";
		-- SUB
					when "100010" =>
						ALUControl <= "110";
		-- AND
					when "100100" =>
						ALUControl <= "000";
		-- OR
					when "100101" =>
						ALUControl <= "001";
		-- SLT
					when "101010" =>
						ALUControl <= "111";
		-- Undefined
					when others =>
						ALUControl <= "011";
				end case;
		-- Undefined
			when "11" =>
				ALUControl <= "011";
		-- Undefined
			when others =>
				ALUControl <= "011";
		end case;
	end process;
end Behavioral;

