----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:42:48 CEST 2013 
-- Design Name: 
-- Module Name:		MulticycleMIPS - Structural
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

entity MulticycleMIPS is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		Leds		: out	STD_LOGIC_VECTOR(7 downto 0);
		Segment		: out	STD_LOGIC_VECTOR(7 downto 0);
		Active		: out	STD_LOGIC_VECTOR(3 downto 0)
	);
end MulticycleMIPS;

architecture Structural of MulticycleMIPS is

component PC is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		PCEn		: in	STD_LOGIC;
		NextPC		: in	STD_LOGIC_VECTOR(7 downto 0);
		Address		: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component Memory is
	Port (
		Clk			: in	STD_LOGIC;
		MemRead		: in	STD_LOGIC;
		MemWrite	: in	STD_LOGIC;
		Address		: in	STD_LOGIC_VECTOR(7 downto 0);
		WriteData	: in	STD_LOGIC_VECTOR(7 downto 0);
		MemData		: out	STD_LOGIC_VECTOR(7 downto 0);
		Port0		: out	STD_LOGIC_VECTOR(7 downto 0);
		Port1		: out	STD_LOGIC_VECTOR(7 downto 0);
		Port2		: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component InstructionRegister is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		IRWrite		: in	STD_LOGIC_VECTOR(3 downto 0);
		MemData		: in	STD_LOGIC_VECTOR(7 downto 0);
		Instruction	: out	STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component MemoryDataRegister is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		MemData		: in	STD_LOGIC_VECTOR(7 downto 0);
		WriteData	: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component Control is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		Op			: in	STD_LOGIC_VECTOR(5 downto 0);
		PCWriteCond	: out	STD_LOGIC;
		PCWrite		: out	STD_LOGIC;
		IorD		: out	STD_LOGIC;
		MemRead		: out	STD_LOGIC;
		MemWrite	: out	STD_LOGIC;
		MemToReg	: out	STD_LOGIC;
		IRWrite		: out	STD_LOGIC_VECTOR(3 downto 0);
		RegDest		: out	STD_LOGIC;
		RegWrite	: out	STD_LOGIC;
		ALUSrcA		: out	STD_LOGIC;
		ALUSrcB		: out	STD_LOGIC_VECTOR(1 downto 0);
		ALUOp		: out	STD_LOGIC_VECTOR(1 downto 0);
		PCSource	: out	STD_LOGIC_VECTOR(1 downto 0)
	);
end component;

component Registers is
	Port (
		Clk, Rst		: in	STD_LOGIC;
		RegWrite		: in	STD_LOGIC;
		ReadRegister1	: in	STD_LOGIC_VECTOR(4 downto 0);
		ReadRegister2	: in	STD_LOGIC_VECTOR(4 downto 0);
		WriteRegister	: in	STD_LOGIC_VECTOR(4 downto 0);
		WriteData		: in	STD_LOGIC_VECTOR(7 downto 0);
		ReadData1		: out	STD_LOGIC_VECTOR(7 downto 0);
		ReadData2		: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component Register8Bits is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		ReadData	: in	STD_LOGIC_VECTOR(7 downto 0);
		WriteData	: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component ALUControl is
	Port (
		ALUOp		: in	STD_LOGIC_VECTOR(1 downto 0);
		Funct		: in	STD_LOGIC_VECTOR(5 downto 0);
		ALUControl	: out	STD_LOGIC_VECTOR(2 downto 0)
	);
end component;

component ALU is
	Port (
		SrcA		: in	STD_LOGIC_VECTOR(7 downto 0);
		SrcB		: in	STD_LOGIC_VECTOR(7 downto 0);
		ALUControl	: in	STD_LOGIC_VECTOR(2 downto 0);
		ALUResult	: out	STD_LOGIC_VECTOR(7 downto 0);
		Zero		: out	STD_LOGIC
	);
end component;

component ALUOut is
	Port (
		Clk, Rst	: in	STD_LOGIC;
		ALUResult	: in	STD_LOGIC_VECTOR(7 downto 0);
		WriteData	: out	STD_LOGIC_VECTOR(7 downto 0)
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

component DisplayManager is
    Port ( 
        Clk			: in  STD_LOGIC;
        Enable		: in  STD_LOGIC;
        Digit		: in  STD_LOGIC_VECTOR(15 downto 0);
        Segment		: out STD_LOGIC_VECTOR(7 downto 0);
        Active		: out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

-- Intermediate signals declaration
	signal s_Clk_mem		: STD_LOGIC;
	signal s_Clk			: STD_LOGIC;
	signal s_Display		: STD_LOGIC_VECTOR(15 downto 0);
	signal s_Div			: STD_LOGIC;

	signal s_PCEn			: STD_LOGIC;
	signal s_NextPC			: STD_LOGIC_VECTOR(7 downto 0);
	signal s_PCAddress		: STD_LOGIC_VECTOR(7 downto 0);
	signal s_Address		: STD_LOGIC_VECTOR(7 downto 0);
	signal s_AData			: STD_LOGIC_VECTOR(7 downto 0);
	signal s_BData			: STD_LOGIC_VECTOR(7 downto 0);
	signal s_MemData		: STD_LOGIC_VECTOR(7 downto 0);
	signal s_MemDataToReg	: STD_LOGIC_VECTOR(7 downto 0);
	signal s_Instruction	: STD_LOGIC_VECTOR(31 downto 0);
	signal s_WriteRegister	: STD_LOGIC_VECTOR(4 downto 0);
	signal s_WriteData		: STD_LOGIC_VECTOR(7 downto 0);
	signal s_ALUControl		: STD_LOGIC_VECTOR(2 downto 0);
	signal s_SrcA			: STD_LOGIC_VECTOR(7 downto 0);
	signal s_SrcB			: STD_LOGIC_VECTOR(7 downto 0);
	signal s_ALUResult		: STD_LOGIC_VECTOR(7 downto 0);
	signal s_ALUOut			: STD_LOGIC_VECTOR(7 downto 0);
	signal s_Zero			: STD_LOGIC;
	signal s_JAddr			: STD_LOGIC_VECTOR(7 downto 0);
	signal s_ReadData1		: STD_LOGIC_VECTOR(7 downto 0);
	signal s_ReadData2		: STD_LOGIC_VECTOR(7 downto 0);
	signal s_Op				: STD_LOGIC_VECTOR(5 downto 0);
	signal s_PCWriteCond	: STD_LOGIC;
	signal s_PCWrite		: STD_LOGIC;
	signal s_IorD			: STD_LOGIC;
	signal s_MemRead		: STD_LOGIC;
	signal s_MemWrite		: STD_LOGIC;
	signal s_MemToReg		: STD_LOGIC;
	signal s_IRWrite		: STD_LOGIC_VECTOR(3 downto 0);
	signal s_RegDest		: STD_LOGIC;
	signal s_RegWrite		: STD_LOGIC;
	signal s_ALUSrcA		: STD_LOGIC;
	signal s_ALUSrcB		: STD_LOGIC_VECTOR(1 downto 0);
	signal s_ALUOp			: STD_LOGIC_VECTOR(1 downto 0);
	signal s_PCSource		: STD_LOGIC_VECTOR(1 downto 0);
begin
	
	s_PCEn <= s_PCWrite or (s_PCWriteCond and s_Zero);
	s_Op <= s_Instruction(31 downto 26);

	with s_PCSource select
	s_NextPC <=	s_ALUResult	when "00",
				s_ALUOut	when "01",
				s_JAddr		when "10",
				(others => '0') when others;

	with s_IorD select
	s_Address <=	s_PCAddress	when '0',
					s_ALUOut	when '1',
					(others => '0') when others;

	with s_RegDest select
	s_WriteRegister <=	s_Instruction(20 downto 16) when '0',
						s_Instruction(15 downto 11) when '1',
						(others => '0') when others;

	with s_MemToReg select
	s_WriteData	<=	s_ALUOut		when '0',
					s_MemDataToReg	when '1',
					(others => '0') when others;

	with s_ALUSrcA select
	s_SrcA	<=	s_PCAddress when '0',
				s_AData		when '1',
				(others => '0') when others;

	with s_ALUSrcB select
	s_SrcB	<=	s_BData						when "00",
				(0=>'1', others=>'0')		when "01",
				s_Instruction(7 downto 0)	when "10",
				s_Instruction(7 downto 0)	when "11",
				(others => '0') when others;

	s_JAddr <= s_Instruction(5 downto 0) & "00";

PC_0 : PC
	port map (
		Clk			 => s_Clk,
		Rst			 => Rst,
		PCEn		 => s_PCEn,
		NextPC		 => s_NextPC,
		Address		 => s_PCAddress
	);

Memory_0 : Memory
	port map (
		Clk			 => s_Clk_mem,
		MemRead		 => s_MemRead,
		MemWrite	 => s_MemWrite,
		Address		 => s_Address,
		WriteData	 => s_BData,
		MemData		 => s_MemData,
		Port0		 => Leds,
		Port1		 => s_Display(15 downto 8),
		Port2		 => s_Display(7 downto 0)
	);

InstructionRegister_0 : InstructionRegister
	port map (
		Clk			 => s_Clk,
		Rst			 => Rst,
		IRWrite		 => s_IRWrite,
		MemData		 => s_MemData,
		Instruction	 => s_Instruction
	);

MemoryDataRegister_0 : MemoryDataRegister
	port map (
		Clk			 => s_Clk,
		Rst			 => Rst,
		MemData		 => s_MemData,
		WriteData	 => s_MemDataToReg
	);

Control_0 : Control
	port map (
		Clk			 => s_Clk,
		Rst			 => Rst,
		Op			 => s_Op,
		PCWriteCond	 => s_PCWriteCond,
		PCWrite		 => s_PCWrite,
		IorD		 => s_IorD,
		MemRead		 => s_MemRead,
		MemWrite	 => s_MemWrite,
		MemToReg	 => s_MemToReg,
		IRWrite		 => s_IRWrite,
		RegDest		 => s_RegDest,
		RegWrite	 => s_RegWrite,
		ALUSrcA		 => s_ALUSrcA,
		ALUSrcB		 => s_ALUSrcB,
		ALUOp		 => s_ALUOp,
		PCSource	 => s_PCSource
	);

Registers_0 : Registers
	port map (
		Clk				 => s_Clk,
		Rst				 => Rst,
		RegWrite		 => s_RegWrite,
		ReadRegister1	 => s_Instruction(25 downto 21),
		ReadRegister2	 => s_Instruction(20 downto 16),
		WriteRegister	 => s_WriteRegister,
		WriteData		 => s_WriteData,
		ReadData1		 => s_ReadData1,
		ReadData2		 => s_ReadData2
	);

Register8Bits_A : Register8Bits
	port map (
		Clk			 => s_Clk,
		Rst			 => Rst,
		ReadData	 => s_ReadData1,
		WriteData	 => s_AData
	);

Register8Bits_B : Register8Bits
	port map (
		Clk			 => Clk,
		Rst			 => Rst,
		ReadData	 => s_ReadData2,
		WriteData	 => s_BData
	);

ALUControl_0 : ALUControl
	port map (
		ALUOp		 => s_ALUOp,
		Funct		 => s_Instruction(5 downto 0),
		ALUControl	 => s_ALUControl
	);

ALU_0 : ALU
	port map (
		SrcA		 => s_SrcA,
		SrcB		 => s_SrcB,
		ALUControl	 => s_ALUControl,
		ALUResult	 => s_ALUResult,
		Zero		 => s_Zero
	);

ALUOut_0 : ALUOut
	port map (
		Clk			 => s_Clk,
		Rst			 => Rst,
		ALUResult	 => s_ALUResult,
		WriteData	 => s_ALUOut
	);

ClockDivider_CPU : ClockDivider
	generic map (DIVIDER  => 10000000, PULSE => false)
    port map (
		Clk	 => Clk,
		Rst	 => Rst,
		Div	 => s_Clk
    );

ClockDivider_Display : ClockDivider
	generic map (DIVIDER  => 416666)
    port map (
		Clk	 => Clk,
		Rst	 => Rst,
		Div	 => s_Div
    );

-- Comentar/descomentar para BlockMEM usar
	--s_Clk_mem <= s_Clk;
ClockDivider_Memory : ClockDivider
	generic map (DIVIDER  => 5000000, PULSE => false)
    port map (
		Clk	 => Clk,
		Rst	 => Rst,
		Div	 => s_Clk_mem
    );

DisplayManager_0 : DisplayManager
    port map (
        Clk			 => Clk,
        Enable		 => s_Div,
        Digit		 => s_Display(15 downto 0),
        Segment		 => Segment,
        Active		 => Active
    );
end Structural;

