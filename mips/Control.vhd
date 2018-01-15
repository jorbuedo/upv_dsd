----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:40:48 CEST 2013 
-- Design Name: 
-- Module Name:		Control - Behavioral
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

entity Control is
	Port (
		--TEST		: out	STD_LOGIC_VECTOR(7 downto 0);

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
end Control;

architecture Behavioral of Control is
	type FSM_t is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13);
	signal current_s, next_s	: FSM_t;
	constant LB_c	: STD_LOGIC_VECTOR(5 downto 0) := "100000";
	constant SB_c	: STD_LOGIC_VECTOR(5 downto 0) := "101000";
	constant ADDI_c	: STD_LOGIC_VECTOR(5 downto 0) := "001000";
	constant R_c	: STD_LOGIC_VECTOR(5 downto 0) := "000000";
	constant BEQ_c	: STD_LOGIC_VECTOR(5 downto 0) := "000100";
	constant J_c	: STD_LOGIC_VECTOR(5 downto 0) := "000010";
begin
	process(Clk, Rst)
	begin
		if(Rst = '1') then
			current_s <= s0;
		elsif(Clk'event and Clk = '1') then
			current_s <= next_s;
		end if;
	end process;

	process(current_s, Op)
	begin
		PCWriteCond	<= '0';
        PCWrite	   	<= '0'; 
        IorD	   	<= '0'; 
        MemRead	   	<= '0'; 
        MemWrite   	<= '0'; 
        MemToReg   	<= '0'; 
        IRWrite	   	<= (others => '0'); 
        RegDest	   	<= '0'; 
        RegWrite   	<= '0'; 
        ALUSrcA	   	<= '0'; 
        ALUSrcB	   	<= (others => '0'); 
        ALUOp	   	<= (others => '0'); 
        PCSource   	<= (others => '0'); 

		case current_s is
		-- Instruction Fetch
			when s0 =>
			--TEST <= "00000000";
				MemRead		<= '1';
				ALUSrcA		<= '0';
				IorD		<= '0';
				IRWrite		<= "1000";
				ALUSrcB		<= "01";
				ALUOp		<= "00";
				PCWrite		<= '1';
				PCSource	<= "00";

				next_s		<= s1;
			when s1 =>
			--TEST <= "00000001";
				MemRead		<= '1';
				ALUSrcA		<= '0';
				IorD		<= '0';
				IRWrite		<= "0100";
				ALUSrcB		<= "01";
				ALUOp		<= "00";
				PCWrite		<= '1';
				PCSource	<= "00";

				next_s		<= s2;
			when s2 =>
			--TEST <= "00000010";
				MemRead		<= '1';
				ALUSrcA		<= '0';
				IorD		<= '0';
				IRWrite		<= "0010";
				ALUSrcB		<= "01";
				ALUOp		<= "00";
				PCWrite		<= '1';
				PCSource	<= "00";

				next_s		<= s3;
			when s3 =>
			--TEST <= "00000011";
				MemRead		<= '1';
				ALUSrcA		<= '0';
				IorD		<= '0';
				IRWrite		<= "0001";
				ALUSrcB		<= "01";
				ALUOp		<= "00";
				PCWrite		<= '1';
				PCSource	<= "00";

				next_s		<= s4;
		-- Instruction Decode
			when s4 =>
			--TEST <= "00000100";
				ALUSrcA		<= '0';
				ALUSrcB		<= "11";
				ALUOp		<= "00";

				if(Op = LB_c or Op = SB_c or Op = ADDI_c) then
					next_s	<= s5;
				elsif(Op = R_c) then
					next_s	<= s10;
				elsif(Op = BEQ_c) then
					next_s	<= s12;
				elsif(Op = J_c) then
					next_s	<= s13;
				else
					next_s	<= s0;
				end if;
		-- Memory Address calculation
			when s5 =>
			--TEST <= "00000101";
				ALUSrcA		<= '1';
				ALUSrcB		<= "10";
				ALUOp		<= "00";

				if(Op = LB_c) then
					next_s	<= s6;
				elsif(Op = SB_c) then
					next_s	<= s8;
				elsif(Op = ADDI_c) then
					next_s	<= s9;
				else
					next_s	<= s0;
				end if;
		-- Memory access read
			when s6 =>
			--TEST <= "00000110";
				MemRead		<= '1';
				IorD		<= '1';

				next_s		<= s7;
		-- Write
			when s7 =>
			--TEST <= "00000111";
				RegDest		<= '0';
				RegWrite	<= '1';
				MemToReg	<= '1';
				
				next_s		<= s0;
		-- Memory access write
			when s8 =>
			--TEST <= "00001000";
				MemWrite	<= '1';
				IorD		<= '1';

				next_s		<= s0;
		-- ADDI
			when s9 =>
			--TEST <= "00001001";
				RegDest		<= '0';
				RegWrite	<= '1';
				MemToReg	<= '0';

				next_s		<= s0;
		-- Execution
			when s10 =>
			--TEST <= "00001010";
				ALUSrcA		<= '1';
				ALUSrcB		<= "00";
				ALUOp		<= "10";

				next_s		<= s11;
		-- Type R execution
			when s11 =>
			--TEST <= "00001011";
				RegDest		<= '1';
				RegWrite	<= '1';
				MemToReg	<= '0';

				next_s		<= s0;
		-- Jump BEQ execution
			when s12 =>
			--TEST <= "00001100";
				ALUSrcA		<= '1';
				ALUSrcB		<= "00";
				ALUOp		<= "01";
				PCWriteCond	<= '1';
				PCSource	<= "01";

				next_s		<= s0;
		-- Jump J execution
			when s13 =>
			--TEST <= "00001101";
				PCWrite		<= '1';
				PCSource	<= "10";

				next_s		<= s0;
			when others =>
				next_s		<= s0;
		end case;
	end process;
end Behavioral;

