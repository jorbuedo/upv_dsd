----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Sun Mar  3 00:31:10 CET 2013 
-- Design Name: 
-- Module Name:      SevenSegment - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: DSD - Practice 1 - Exercise
--						Sevent segment controller
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity SevenSegment is
    Port ( 
        enable	: in  STD_LOGIC_VECTOR(3 downto 0);	-- Valid digits
        digit	: in  STD_LOGIC_VECTOR(3 downto 0);	-- Hex digit
        segment : out  STD_LOGIC_VECTOR(7 downto 0); -- Lighted segments for hex
        active	: out  STD_LOGIC_VECTOR(3 downto 0)	-- Lighted digits
    );
end SevenSegment;

architecture Behavioral of SevenSegment is

begin
	process(enable, digit)
	begin
		case digit is
			--    0 to F                   ABCDEFGP
			when "0000" => segment <= not "11111100"; -- 0
			when "0001" => segment <= not "01100000"; -- 1
			when "0010" => segment <= not "11011010"; -- 2
			when "0011" => segment <= not "11110010"; -- 3
			when "0100" => segment <= not "01100110"; -- 4
			when "0101" => segment <= not "10110110"; -- 5
			when "0110" => segment <= not "10111110"; -- 6
			when "0111" => segment <= not "11100000"; -- 7
			when "1000" => segment <= not "11111110"; -- 8
			when "1001" => segment <= not "11110110"; -- 9
			when "1010" => segment <= not "11101110"; -- 10
			when "1011" => segment <= not "00111110"; -- 11
			when "1100" => segment <= not "10011100"; -- 12
			when "1101" => segment <= not "01111010"; -- 13
			when "1110" => segment <= not "10011110"; -- 14
			when "1111" => segment <= not "10001110"; -- 15
			when others => segment <= not "00000001"; -- null
		end case;
	end process;
	active <= not enable;
end Behavioral;

