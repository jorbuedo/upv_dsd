----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:41:11 CEST 2013 
-- Design Name: 
-- Module Name:		ALU - Behavioral
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

entity ALU is
	Port (
		SrcA		: in	STD_LOGIC_VECTOR(7 downto 0);
		SrcB		: in	STD_LOGIC_VECTOR(7 downto 0);
		ALUControl	: in	STD_LOGIC_VECTOR(2 downto 0);
		ALUResult	: out	STD_LOGIC_VECTOR(7 downto 0);
		Zero		: out	STD_LOGIC
	);
end ALU;

architecture Behavioral of ALU is
	signal Result_s	: STD_LOGIC_VECTOR(7 downto 0);
	signal Zero_s	: STD_LOGIC_VECTOR(7 downto 0);
begin
	Zero_s <= (others => '0');
	process(SrcA, SrcB, ALUControl)
	begin
		case ALUControl is
		-- ADD
			when "010" =>
				Result_s <= std_logic_vector(signed(SrcA) + signed(SrcB));
		-- SUB
			when "110" =>
				Result_s <= std_logic_vector(signed(SrcA) - signed(SrcB));
		-- AND
			when "000" =>
				Result_s <= SrcA and SrcB;
		-- OR
			when "001" =>
				Result_s <= SrcA or SrcB;
		-- SLT
			when "111" =>
				if(signed(SrcA) < signed(SrcB)) then
					Result_s <= (0 => '1', others => '0');
				else
					Result_s <= (others => '0');
				end if;
			when others =>
				Result_s <= (others => '0');
		end case;
	end process;
	ALUResult <= Result_s;
	Zero <= '1' when (Result_s = Zero_s) else '0';
end Behavioral;

