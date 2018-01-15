--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:19:53 05/15/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/mips/ALU_tb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         SrcA : IN  std_logic_vector(7 downto 0);
         SrcB : IN  std_logic_vector(7 downto 0);
         ALUControl : IN  std_logic_vector(2 downto 0);
         ALUResult : OUT  std_logic_vector(7 downto 0);
         Zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SrcA : std_logic_vector(7 downto 0) := (others => '0');
   signal SrcB : std_logic_vector(7 downto 0) := (others => '0');
   signal ALUControl : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(7 downto 0);
   signal Zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          SrcA => SrcA,
          SrcB => SrcB,
          ALUControl => ALUControl,
          ALUResult => ALUResult,
          Zero => Zero
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	  SrcA <= "00011010";
	  SrcB <= "01010010";
	  ALUControl <= "010";
      wait for 10 ns;	
	  ALUControl <= "110";
      wait for 10 ns;	
	  ALUControl <= "010";
      wait for 10 ns;	
	  ALUControl <= "110";
      wait for 10 ns;	
	  ALUControl <= "000";
      wait for 10 ns;	
	  ALUControl <= "001";
      wait for 10 ns;	
	  ALUControl <= "111";
      wait for 10 ns;	
	  SrcB <= "00011010";
	  SrcA <= "01010010";

      -- insert stimulus here 

      wait;
   end process;

END;
