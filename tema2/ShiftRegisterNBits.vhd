----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Wed Feb 20 18:07:35 CET 2013 
-- Design Name: 
-- Module Name:      ShiftRegisterNBits - structural
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

entity ShiftRegisterNBits is
	generic (SIZE : integer := 8);
	Port (  clk     : in  STD_LOGIC;
			rst     : in  STD_LOGIC;
			bit_in  : in  STD_LOGIC;
			bit_out : out  STD_LOGIC);
end ShiftRegisterNBits;

architecture Structural of ShiftRegisterNBits is

	component FFD is
	port (
		clk, rst, d : in std_logic;
		q, q_n : out std_logic);
	end component;
	
	signal ff_out : std_logic_vector(SIZE downto 0);
	
begin
	ff_out(0) <= bit_in;
	bit_out <= ff_out(SIZE);

	gen : for i in 0 to SIZE-1 generate
	begin
		ff : FFD port map (
			clk => clk,
			rst => rst,
			d => ff_out(i),
			q => ff_out(i+1),
			q_n => open
		);
	end generate;
end Structural;

architecture Behavioral of ShiftRegisterNBits is
	signal aux	: std_logic_vector(SIZE-1 downto 0);
begin
	process(clk, rst)
	begin
		if rst='1' then
			aux <= (others => '0');
		elsif clk'event and clk='1' then
			aux <= aux(SIZE-2 downto 0) & bit_in;
		end if;
	end process;
	bit_out <= aux(SIZE-1);
end Behavioral;

