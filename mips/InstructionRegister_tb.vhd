--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:31:15 05/05/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/mips/InstructionRegister_tb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InstructionRegister
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY InstructionRegister_tb IS
END InstructionRegister_tb;
 
ARCHITECTURE behavior OF InstructionRegister_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionRegister
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         IRWrite : IN  std_logic_vector(3 downto 0);
         MemData : IN  std_logic_vector(7 downto 0);
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal IRWrite : std_logic_vector(3 downto 0) := (others => '0');
   signal MemData : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionRegister PORT MAP (
          Clk => Clk,
          Rst => Rst,
          IRWrite => IRWrite,
          MemData => MemData,
          Instruction => Instruction
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Rst <= '1';
	wait for 10 ns;
		Rst <= '0';
	wait for 10 ns;
		MemData <= "11111111";
		IRWrite <= "1000";
	wait for 10 ns;
		MemData <= "10101010";
		IRWrite <= "0100";
	wait for 10 ns;
		MemData <= "00001111";
		IRWrite <= "0010";
	wait for 10 ns;
		MemData <= "11110000";
		IRWrite <= "0001";
	wait for 10 ns;
		MemData <= "11101111";
		IRWrite <= "1000";
	wait for 10 ns;
		MemData <= "11101110";
		IRWrite <= "0100";
	wait for 10 ns;
		MemData <= "01100111";
		IRWrite <= "0010";
	wait for 10 ns;
		MemData <= "11101000";
		IRWrite <= "0001";
	wait for 10 ns;
		MemData <= "11101111";
		IRWrite <= "1000";
      -- insert stimulus here 

      wait;
   end process;

END;
