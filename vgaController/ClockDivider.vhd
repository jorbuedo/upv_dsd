----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Sun Mar  3 23:06:34 CET 2013 
-- Design Name: 
-- Module Name:      ClockDivider - Behavioral
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

	-- DIVIDER : Factor to divide the clock
	-- PULSE if true, generates pulses, else dividied clock
entity ClockDivider is
	generic(DIVIDER : natural := 4 ; PULSE : boolean := true);
    Port ( 
		Clk	: in	STD_LOGIC;
		Rst	: in	STD_LOGIC;
		Div	: out	STD_LOGIC
    );
end ClockDivider;

architecture Behavioral of ClockDivider is
	signal final	: STD_LOGIC := '0';
	signal count	: natural range 0 to DIVIDER/2-1 := 0;
begin
	process(Clk, Rst)
	begin
		if Rst = '1' then
			final <= '0';
			count <= 0;
		elsif Clk'event and Clk='1' then
			if PULSE = true then
				final <= '0';
			end if;
			if count >= DIVIDER/2-1 then
				if PULSE = true then
					final <= '1';
				else
					final <= not final;
				end if;
				count <= 0;
			else
				count <= count+1;
			end if;
		end if;
	end process;
	Div <= final;
end Behavioral;

