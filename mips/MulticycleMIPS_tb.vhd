--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:37:29 05/15/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/mips/MulticycleMIPS_tb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MulticycleMIPS
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
 
ENTITY MulticycleMIPS_tb IS
END MulticycleMIPS_tb;
 
ARCHITECTURE behavior OF MulticycleMIPS_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MulticycleMIPS
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Leds : OUT  std_logic_vector(7 downto 0);
         Segment : OUT  std_logic_vector(7 downto 0);
         Active : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';

 	--Outputs
   signal Leds : std_logic_vector(7 downto 0);
   signal Segment : std_logic_vector(7 downto 0);
   signal Active : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MulticycleMIPS PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Leds => Leds,
          Segment => Segment,
          Active => Active
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

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
