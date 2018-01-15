----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Mon Mar  4 00:13:55 CET 2013 
-- Design Name: 
-- Module Name:      DisplayManager - Structural
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.02 - Improved with FSM
-- Additional Comments: 
-- DisplayManager controls behavior of Nexys3 7Segments
-- Input is given in 16 bit, displayed as 4 hex
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DisplayManager is
    Port ( 
        Clk			: in  STD_LOGIC;
        Enable		: in  STD_LOGIC; -- Refresh if Enabled, else keep state
        Digit		: in  STD_LOGIC_VECTOR(15 downto 0); -- 4 hex Digits
        Segment		: out STD_LOGIC_VECTOR(7 downto 0); -- Lighted Segments
        Active		: out STD_LOGIC_VECTOR(3 downto 0) -- Active Digit to use
    );
end DisplayManager;

architecture Structural of DisplayManager is
component SevenSegment is
    Port ( 
        Enable		: in  STD_LOGIC_VECTOR(3 downto 0);
        Digit		: in  STD_LOGIC_VECTOR(3 downto 0);
        Segment		: out STD_LOGIC_VECTOR(7 downto 0);
        Active		: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;
	signal Turn	: STD_LOGIC_VECTOR(3 downto 0);
	signal Result : STD_LOGIC_VECTOR(3 downto 0);
	type FSM_t is (s0,s1,s2,s3);
	signal current_s, next_s : FSM_t;
begin
	process(Clk, Enable)
	begin
		if (Clk'event and Clk = '1' and Enable = '1') then
			current_s <= next_s;
		end if;
	end process;

	process(current_s, Digit)
	begin
		case current_s is
			when s0 =>
				Turn <= "1000";
				Result <= Digit(15 downto 12);

				next_s <= s1;
			when s1 =>
				Turn <= "0100";
				Result <= Digit(11 downto 8);

				next_s <= s2;
			when s2 =>
				Turn <= "0010";
				Result <= Digit(7 downto 4);

				next_s <= s3;
			when s3 =>
				Turn <= "0001";
				Result <= Digit(3 downto 0);

				next_s <= s0;
			when others =>
				next_s <= s0;
		end case;
	end process;




	SevenSegment_0 : SevenSegment
	    port map (
	        Enable	 => Turn,
	        Digit	 => Result,
	        Segment  => Segment,
	        Active	 => Active
	    );
end Structural;

