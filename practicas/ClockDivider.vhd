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

entity ClockDivider is
	-- DIVIDER : Factor to divide the clock
	-- PULSE if true, generates pulses, else dividied clock
	generic(DIVIDER : natural := 4 ; PULSE : boolean := true);
    Port ( 
		clk_i	: in	STD_LOGIC;
		reset	: in	STD_LOGIC;
		clk_o	: out	STD_LOGIC
    );
end ClockDivider;

architecture Behavioral of ClockDivider is
	signal final	: STD_LOGIC := '0';
	signal count	: natural range 0 to DIVIDER/2-1 := 0;
begin
	process(clk_i, reset)
	begin
		if reset = '1' then
			final <= '0';
			count <= 0;
		elsif clk_i'event and clk_i='1' then
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
	clk_o <= final;
end Behavioral;

