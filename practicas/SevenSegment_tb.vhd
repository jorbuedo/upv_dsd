--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:20:38 03/03/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/practicas/SevenSegment_tb.vhd
-- Project Name:  practicas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SevenSegment
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
 
ENTITY SevenSegment_tb IS
END SevenSegment_tb;
 
ARCHITECTURE behavior OF SevenSegment_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SevenSegment
    PORT(
         enable : IN  std_logic_vector(3 downto 0);
         digit : IN  std_logic_vector(3 downto 0);
         segment : OUT  std_logic_vector(0 to 7);
         active : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal enable : std_logic_vector(3 downto 0) := (others => '0');
   signal digit : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal segment : std_logic_vector(0 to 7);
   signal active : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SevenSegment PORT MAP (
          enable => enable,
          digit => digit,
          segment => segment,
          active => active
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		enable <= "0010";
		wait for 10 ns;
		digit <= "0010";
		wait for 10 ns;
		
		enable <= "1000";
		wait for 10 ns;
		digit <= "1101";
		wait for 10 ns;

		enable <= "0110";
		wait for 10 ns;
		digit <= "0110";
		wait for 10 ns;
		
		enable <= "0010";
		wait for 10 ns;
		digit <= "0011";
		wait for 10 ns;
		
      wait;
   end process;

END;
