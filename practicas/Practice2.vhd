----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Mon Mar  4 01:42:01 CET 2013 
-- Design Name: 
-- Module Name:      Practice2 - Structural
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

entity Practice2 is
    Port ( 
        clk		: in  STD_LOGIC;
        digit	: in  STD_LOGIC_VECTOR(7 downto 0);
        segment : out  STD_LOGIC_VECTOR(7 downto 0);
        active	: out  STD_LOGIC_VECTOR(3 downto 0)
    );
end Practice2;

architecture Structural of Practice2 is

component SegmentDisplay is
    Port ( 
        clk		: in  STD_LOGIC;
        enable	: in  STD_LOGIC;
        digit	: in  STD_LOGIC_VECTOR(15 downto 0);
        segment : out STD_LOGIC_VECTOR(7 downto 0);
        active	: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component ClockDivider is
	generic(DIVIDER : natural := 4);
    Port ( 
        clk_i	: in	STD_LOGIC;
		reset	: in	STD_LOGIC;
        clk_o	: out	STD_LOGIC
    );
end component;

component FullAdderNBits is
	generic(SIZE : natural := 32);
    Port ( 
        a_i : in  STD_LOGIC_VECTOR(SIZE-1 downto 0);
        b_i : in  STD_LOGIC_VECTOR(SIZE-1 downto 0);
        c_i : in  STD_LOGIC;
        c_o : out  STD_LOGIC;
        s_o : out  STD_LOGIC_VECTOR(SIZE-1 downto 0)
    );
end component;
	signal fac	: STD_LOGIC;
	signal fas	: STD_LOGIC_VECTOR(3 downto 0);
	signal clkdiv	: STD_LOGIC;
	signal result	: STD_LOGIC_VECTOR(15 downto 0);
begin
	FullAdderNBits_0 : FullAdderNBits
		generic map (SIZE  => 4)
	    port map (
	        a_i  => digit(7 downto 4),
	        b_i  => digit(3 downto 0),
	        c_i  => '0',
	        c_o  => fac,
	        s_o  => fas
	    );

	ClockDivider_0 : ClockDivider
		generic map (DIVIDER  => 416666)
	    port map (
	        clk_i	 => clk,
			reset	 => '0',
	        clk_o	 => clkdiv
	    );

	SegmentDisplay_0 : SegmentDisplay
	    port map (
	        clk		 => clk,
			enable	 => clkdiv,
	        digit	 => result,
	        segment  => segment,
	        active	 => active
	    );
	
	result <= "000" & fac & fas & digit;
end Structural;

