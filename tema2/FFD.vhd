----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Wed Feb 20 18:11:55 CET 2013 
-- Design Name: 
-- Module Name:      FFD - Behavioral
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

entity FFD is
    port (
	    clk, rst, d, prst	: in std_logic;
		q, q_n      		: out std_logic);
end FFD;

architecture Behavioral of FFD is
    signal s : std_logic;
begin
    process(clk, rst, prst)
    begin
        if rst='1' then
            s <= '0';
		elsif prst='1' then
			s <= '1';
        elsif clk'event and clk='1' then
            s <= d;
        end if;
    end process;
    q   <= s;
    q_n <= not s;
end Behavioral;
