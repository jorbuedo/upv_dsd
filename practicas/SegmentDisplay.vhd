----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Mon Mar  4 00:13:55 CET 2013 
-- Design Name: 
-- Module Name:      SegmentDisplay - Structural
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
-- SegmentDisplay controls behavior of Nexys3 7segments
-- Input is given in 16 bit, displayed as 4 hex
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SegmentDisplay is
    Port ( 
        clk			: in  STD_LOGIC;
        enable		: in  STD_LOGIC; -- Refresh if enabled, else keep state
        digit		: in  STD_LOGIC_VECTOR(15 downto 0); -- 4 hex digits
        segment		: out STD_LOGIC_VECTOR(7 downto 0); -- Lighted segments
        active		: out STD_LOGIC_VECTOR(3 downto 0) -- Active digit to use
    );
end SegmentDisplay;

architecture Structural of SegmentDisplay is
component SevenSegment is
    Port ( 
        enable		: in  STD_LOGIC_VECTOR(3 downto 0);
        digit		: in  STD_LOGIC_VECTOR(3 downto 0);
        segment		: out STD_LOGIC_VECTOR(7 downto 0);
        active		: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;
-- turn : State Machine, one '1' bit rotates indicating active
	signal turn	: BIT_VECTOR(3 downto 0) := (0 => '1', others => '0');
-- dwin : DigitWindow : Position of the current hex in @digit vector
	signal dwin : natural range 15 downto 3 := 15;
-- result : Auxiliar for current digit
	signal result : STD_LOGIC_VECTOR(3 downto 0);
begin
	process(clk, enable)
	begin
		--if enable'event and enable = '1' then
		if clk'event and clk = '1' then
			if enable = '1' then
				turn <= turn rol 1;
				if dwin = 3 then
					dwin <= 15;
				else
					dwin <= dwin - 4;
				end if;
			end if;
		end if;
	end process;
	result <= (digit(dwin downto dwin-3));

	SevenSegment_0 : SevenSegment
	    port map (
	        enable	 => to_stdlogicvector(turn),
	        digit	 => result(3 downto 0),
	        segment  => segment,
	        active	 => active
	    );
end Structural;

