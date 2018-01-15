----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Tue May 28 20:13:03 CEST 2013 
-- Design Name: 
-- Module Name:		VGA_Memory - Behavioral
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

entity VGA_Memory is
	Port (
		Clk			: in	STD_LOGIC;
		MemWrite	: in	STD_LOGIC;
		Row			: in	STD_LOGIC_VECTOR(9 downto 0);
		Column		: in	STD_LOGIC_VECTOR(9 downto 0);
		WriteData	: in	STD_LOGIC_VECTOR(5 downto 0);
		MemData		: out	STD_LOGIC_VECTOR(5 downto 0)
	);
end VGA_Memory;


architecture SecondArch of VGA_Memory is

component BlockRAM is
	port (
		clka	: in	STD_LOGIC;
		wea		: in	STD_LOGIC_VECTOR(0 downto 0);
		addra	: in	STD_LOGIC_VECTOR(16 downto 0);
		dina	: in	STD_LOGIC_VECTOR(5 downto 0);
		douta	: out	STD_LOGIC_VECTOR(5 downto 0)
	);
end component;
	signal MemWrite_s	: STD_LOGIC_VECTOR(0 downto 0);
	signal MemData_s	: STD_LOGIC_VECTOR(5 downto 0);
	signal WriteData_s	: STD_LOGIC_VECTOR(5 downto 0);
	signal Address_s	: STD_LOGIC_VECTOR(16 downto 0);
					signal tst: std_LogiC_VecTor(16 downto 0);
begin
	--tst <= '0' & STD_LOGIC_VECTOR(unsigned(Column(9 downto 1)&"0000000") + unsigned(Column(9 downto 1)&"000000") + unsigned(Column(9 downto 1)&"00000") + unsigned(Column(9 downto 1)&"0000")); 
	--Address_s <= STD_LOGIC_VECTOR(unsigned(tst) + (unsigned(Row(9 downto 1))));


	tst <= STD_LOGIC_VECTOR(unsigned(Row(9 downto 1)&"00000000") + unsigned(Row(9 downto 1)&"000000")); 
	Address_s <= STD_LOGIC_VECTOR(unsigned(tst) + (unsigned(Column(9 downto 1))));
	MemWrite_s(0) <= MemWrite;
	WriteData_s <= WriteData;
	MemData <= MemData_s;

	BlockRAM_0 : BlockRAM
	port map(
		clka	=> Clk,
		wea		=> MemWrite_s,
		addra	=> Address_s,
		dina	=> WriteData_s,
		douta	=> MemData_s
	);

end SecondArch;
