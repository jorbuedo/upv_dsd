--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:17:19 03/10/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/tema2/ROM_8_16b_tb.vhd
-- Project Name:  tema2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM_8_16b
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
 
ENTITY ROM_8_16b_tb IS
END ROM_8_16b_tb;
 
ARCHITECTURE behavior OF ROM_8_16b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM_8_16b
    PORT(
         A : IN  std_logic_vector(17 downto 0);
         Q : OUT  std_logic_vector(14 downto 0);
         Q15A1 : INOUT  std_logic;
         BHE : IN  std_logic;
         CE : IN  std_logic;
         OE : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(17 downto 0) := (others => '0');
   signal BHE : std_logic := '0';
   signal CE : std_logic := '1';
   signal OE : std_logic := '1';

	--BiDirs
   signal Q15A1 : std_logic;

 	--Outputs
   signal Q : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_8_16b PORT MAP (
          A => A,
          Q => Q,
          Q15A1 => Q15A1,
          BHE => BHE,
          CE => CE,
          OE => OE
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
	  CE <= '0';
	  wait for 10 ns;
	  OE <= '0';
	  wait for 10 ns;
	  BHE <= '1';
	  wait for 10 ns;
	  OE <= '1';
	  wait for 10 ns;
	  CE <= '1';
	  wait for 10 ns;
	  Q15A1 <= '1';
	  wait for 10 ns;
	  CE <= '0';
	  wait for 10 ns;
	  OE <= '0';
	  wait for 10 ns;
	  BHE <= '0';
	  wait for 10 ns;
	  Q15A1 <= 'Z';
	  wait for 10 ns;

      wait;
   end process;

END;
