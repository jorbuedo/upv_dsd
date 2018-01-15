--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:41:00 03/04/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/practicas/FullAdder_tb.vhd
-- Project Name:  practicas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FullAdder
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
 
ENTITY FullAdder_tb IS
END FullAdder_tb;
 
ARCHITECTURE behavior OF FullAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FullAdder
    PORT(
         a_i : IN  std_logic;
         b_i : IN  std_logic;
         c_i : IN  std_logic;
         c_o : OUT  std_logic;
         s_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a_i : std_logic := '0';
   signal b_i : std_logic := '0';
   signal c_i : std_logic := '0';

 	--Outputs
   signal c_o : std_logic;
   signal s_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FullAdder PORT MAP (
          a_i => a_i,
          b_i => b_i,
          c_i => c_i,
          c_o => c_o,
          s_o => s_o
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

		a_i <= '1';
		wait for 10 ns;
		b_i <= '1';
		wait for 10 ns;
		c_i <= '1';
		wait for 10 ns;
		b_i <= '0';
		wait for 10 ns;
		a_i <= '0';
		wait for 10 ns;
		b_i <= '1';
		wait for 10 ns;
		c_i <= '0';
		wait for 10 ns;

      wait;
   end process;

END;
