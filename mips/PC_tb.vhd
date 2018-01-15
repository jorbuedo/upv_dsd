--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:06:06 05/05/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/mips/PC_tb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY PC_tb IS
END PC_tb;
 
ARCHITECTURE behavior OF PC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         PCEn : IN  std_logic;
         NextPC : IN  std_logic_vector(7 downto 0);
         Address : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal PCEn : std_logic := '0';
   signal NextPC : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Address : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          Clk => Clk,
          Rst => Rst,
          PCEn => PCEn,
          NextPC => NextPC,
          Address => Address
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
      -- insert stimulus here 
		wait for 10 ns;
		Rst <= '0';
		NextPC <= "00100000";
		wait for 10 ns;
		PCEn <= '1';
		NextPC <= "10001000";
		wait for 10 ns;
		PCEn <= '0';
		NextPC <= "00001000";
		wait for 10 ns;
      wait;
   end process;

END;
