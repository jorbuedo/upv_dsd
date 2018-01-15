----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Fri May 24 16:22:52 CEST 2013 
-- Design Name: 
-- Module Name:		VGA_Display - Behavioral
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

entity VGA_Display is
	Port (
		Clk		: in	STD_LOGIC;
		Rst		: in	STD_LOGIC;
		Hsync	: out	STD_LOGIC;
		Vsync	: out	STD_LOGIC;
		Red		: out	STD_LOGIC_VECTOR(2 downto 0);
		Green	: out	STD_LOGIC_VECTOR(2 downto 0);
		Blue	: out	STD_LOGIC_VECTOR(1 downto 0)
	);
end VGA_Display;

architecture Behavioral of VGA_Display is

component VGA_Controller is
	Port (
		Clk		: in	STD_LOGIC;
		Rst		: in	STD_LOGIC;
		Red_i	: in	STD_LOGIC_VECTOR(2 downto 0);
		Green_i	: in	STD_LOGIC_VECTOR(2 downto 0);
		Blue_i	: in	STD_LOGIC_VECTOR(1 downto 0);
		Hsync	: out	STD_LOGIC;
		Vsync	: out	STD_LOGIC;
		Red		: out	STD_LOGIC_VECTOR(2 downto 0);
		Green	: out	STD_LOGIC_VECTOR(2 downto 0);
		Blue	: out	STD_LOGIC_VECTOR(1 downto 0);
		Column	: out	STD_LOGIC_VECTOR(9 downto 0);
		Row		: out	STD_LOGIC_VECTOR(9 downto 0)
	);
end component;


component ClockDivider is
	generic(DIVIDER : natural := 4 ; PULSE : boolean := true);
    Port ( 
		Clk	: in	STD_LOGIC;
		Rst	: in	STD_LOGIC;
		Div	: out	STD_LOGIC
    );
end component;

component VGA_Memory is
	Port (
		Clk			: in	STD_LOGIC;
		MemWrite	: in	STD_LOGIC;
		Row			: in	STD_LOGIC_VECTOR(9 downto 0);
		Column		: in	STD_LOGIC_VECTOR(9 downto 0);
		WriteData	: in	STD_LOGIC_VECTOR(5 downto 0);
		MemData		: out	STD_LOGIC_VECTOR(5 downto 0)
	);
end component;

	signal s_Red		: STD_LOGIC_VECTOR(2 downto 0);
	signal s_Green		: STD_LOGIC_VECTOR(2 downto 0);
	signal s_Blue		: STD_LOGIC_VECTOR(1 downto 0);
	signal s_Div		: STD_LOGIC;
	signal s_Column		: STD_LOGIC_VECTOR(9 downto 0);
	signal s_Row		: STD_LOGIC_VECTOR(9 downto 0);
	signal s_MemData	: STD_LOGIC_VECTOR(5 downto 0);

begin

	--s_Red	<= (others => s_MemData);
	--s_Green	<= (others => s_MemData);
	--s_Blue	<= (others => s_MemData);

	--s_Red <= "111" when s_Row(8) = '1' else "000";
	--s_Green <= "111" when s_Row(4) = '1' and s_Column(4) = '1' else "000";
	--s_Blue <= "11" when s_Column(4) = '0' else "00";

	--s_Red <= s_Column(5 downto 3);
	--s_Green <= s_Row(5 downto 3);
	--s_Blue <= s_Column(3 downto 2) and s_Row(3 downto 2);

	--s_Red <= "111" when s_Column = "1001110110" else "000";
	--s_Green <= "111" when s_Row = "0111001100" else "000";
	--s_Blue <= "00";

	s_Red <= s_MemData(5 downto 4) & '0';
	s_Green <= s_MemData(3 downto 2) & '0';
	s_Blue <= s_MemData(1 downto 0);

VGA_Controller_0 : VGA_Controller
	port map (
		Clk		 => s_Div,
		Rst		 => Rst,
		Red_i	 => s_Red,
		Green_i	 => s_Green,
		Blue_i	 => s_Blue,
		Hsync	 => Hsync,
		Vsync	 => Vsync,
		Red		 => Red,
		Green	 => Green,
		Blue	 => Blue,
		Column	 => s_Column,
		Row		 => s_Row
	);

ClockDivider_0 : ClockDivider
	generic map (DIVIDER  =>  4, PULSE => false)
    port map (
		Clk	 => Clk,
		Rst	 => Rst,
		Div	 => s_Div
    );

VGA_Memory_0 : VGA_Memory
	port map (
		Clk			 => Clk,
		MemWrite	 => '0',
		Row			 => s_Row,
		Column		 => s_Column,
		WriteData	 => (others => '0'),
		MemData		 => s_MemData
	);

end Behavioral;

