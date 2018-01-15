----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Wed Mar 13 10:40:27 CET 2013 
-- Design Name: 
-- Module Name:		WaterBombs- Behavioral
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

entity WaterBombs is
	Port (
		rst	: in	STD_LOGIC;
		clk	: in	STD_LOGIC;
		S	: in	STD_LOGIC_VECTOR(1 downto 0);	-- Sensors
		B	: out	STD_LOGIC_VECTOR(1 downto 0)	-- Bombs
	);
end WaterBombs;

architecture Behavioral of WaterBombs is
type state_t is (s0, s1, s2, s3, s4, s5);
signal current_s, next_s : state_t;

begin
	process(clk, rst)
	begin
		if(rst = '1') then
			current_s <= s0;
		elsif (clk'event and clk = '1') then
			current_s <= next_s;
		end if;
	end process;

	process(current_s, S)
	begin
		case current_s is
			when s0 =>
				B <= "00";
				if(S = "11") then
					next_s <= s0;
				elsif (S = "10") then
					next_s <= s1;
				else
					next_s <= s0;
				end if;
			when s1 =>
				B <= "01";
				if(S = "11") then
					next_s <= s2;
				elsif (S = "10") then
					next_s <= s1;
				elsif (S = "00") then
					next_s <= s3;
				else
					next_s <= s0;
				end if;
			when s2 =>
				B <= "00";
				if(S = "11") then
					next_s <= s2;
				elsif (S = "10") then
					next_s <= s4;
				else
					next_s <= s0;
				end if;
			when s3 =>
				B <= "11";
				if(S = "00") then
					next_s <= s3;
				elsif (S = "10") then
					next_s <= s4;
				else
					next_s <= s0;
				end if;
			when s4 =>
				B <= "10";
				if(S = "11") then
					next_s <= s0;
				elsif (S = "10") then
					next_s <= s4;
				elsif (S = "00") then
					next_s <= s5;
				else
					next_s <= s0;
				end if;
			when s5 =>
				B <= "11";
				if(S = "00") then
					next_s <= s5;
				elsif (S = "10") then
					next_s <= s1;
				else
					next_s <= s0;
				end if;
			when others =>
				B <= "00";
				next_s <= s0;
		end case;
	end process;
end Behavioral;
