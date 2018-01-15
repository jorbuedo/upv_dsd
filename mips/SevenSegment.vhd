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
--						Sevent Segment controller
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity SevenSegment is
    Port ( 
        Enable	: in  STD_LOGIC_VECTOR(3 downto 0);	-- Valid Digits
        Digit	: in  STD_LOGIC_VECTOR(3 downto 0);	-- Hex Digit
        Segment : out  STD_LOGIC_VECTOR(7 downto 0); -- Lighted Segments for hex
        Active	: out  STD_LOGIC_VECTOR(3 downto 0)	-- Lighted Digits
    );
end SevenSegment;

architecture Behavioral of SevenSegment is

begin
	process(Enable, Digit)
	begin
		case Digit is
			--    0 to F                   ABCDEFGP
			when "0000" => Segment <= not "11111100"; -- 0
			when "0001" => Segment <= not "01100000"; -- 1
			when "0010" => Segment <= not "11011010"; -- 2
			when "0011" => Segment <= not "11110010"; -- 3
			when "0100" => Segment <= not "01100110"; -- 4
			when "0101" => Segment <= not "10110110"; -- 5
			when "0110" => Segment <= not "10111110"; -- 6
			when "0111" => Segment <= not "11100000"; -- 7
			when "1000" => Segment <= not "11111110"; -- 8
			when "1001" => Segment <= not "11110110"; -- 9
			when "1010" => Segment <= not "11101110"; -- 10
			when "1011" => Segment <= not "00111110"; -- 11
			when "1100" => Segment <= not "10011100"; -- 12
			when "1101" => Segment <= not "01111010"; -- 13
			when "1110" => Segment <= not "10011110"; -- 14
			when "1111" => Segment <= not "10001110"; -- 15
			when others => Segment <= not "00000001"; -- null
		end case;
	end process;
	Active <= not Enable;
end Behavioral;

