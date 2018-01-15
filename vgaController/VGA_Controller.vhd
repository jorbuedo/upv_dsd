----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Fri May 24 14:10:31 CEST 2013 
-- Design Name: 
-- Module Name:		VGA_Controller - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity VGA_Controller is
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
end VGA_Controller;

architecture Behavioral of VGA_Controller is
	signal HCounter_s	: natural range 0 to 799 := 0;
	signal VCounter_s	: natural range 0 to 520 := 0;
	signal Hon			: STD_LOGIC;
	signal Von			: STD_LOGIC;
begin

	Red <= Red_i when Hon = '1' and Von = '1' else (others => '0');
	Green <= Green_i when Hon = '1' and Von = '1' else (others => '0');
	Blue <= Blue_i when Hon = '1' and Von = '1' else (others => '0');

	process(Clk, Rst)
	begin
		if Rst = '1' then
			HCounter_s <= 0;
			VCounter_s <= 0;
		elsif Clk'event and Clk = '1' then
			if HCounter_s = 799 then
				HCounter_s <= 0;
				if VCounter_s = 520 then 
					VCounter_s <= 0;
				else
					VCounter_s <= VCounter_s + 1;
				end if;
			else
				HCounter_s <= HCounter_s + 1;
			end if;
		end if;
	end process;

	process(HCounter_s, Rst)
	begin
		Column <= (others => '0');
		if HCounter_s < 96 then
			Hsync <= '0';
			Hon <= '0';
		elsif HCounter_s < 144 then
			Hsync <= '1';
			Hon <= '0';
		elsif HCounter_s < 784 then
			Hsync <= '1';
			Hon <= '1';
			Column <= std_logic_vector(to_unsigned(HCounter_s - 144, 10));
		else
			Hsync <= '1';
			Hon <= '0';
		end if;

		if Rst = '1' then
			Hsync <= '0';
			Hon <= '0';
		end if;
	end process;

	process(VCounter_s, Rst)
	begin
		Row <= (others => '0');
		if VCounter_s < 2 then
			Vsync <= '0';
			Von <= '0';
		elsif VCounter_s < 31 then
			Vsync <= '1';
			Von <= '0';
		elsif VCounter_s < 511 then
			Vsync <= '1';
			Von <= '1';
			Row <= std_logic_vector(to_unsigned(VCounter_s - 31, 10));
		else
			Vsync <= '1';
			Von <= '0';
		end if;

		if Rst = '1' then
			Vsync <= '0';
			Von <= '0';
		end if;
	end process;
end Behavioral;

