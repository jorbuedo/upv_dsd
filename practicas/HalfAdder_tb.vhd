--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:42:15 02/27/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/practicas/HalfAdder_tb.vhd
-- Project Name:  practicas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HalfAdder
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
 
ENTITY HalfAdder_tb IS
END HalfAdder_tb;
 
ARCHITECTURE behavior OF HalfAdder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HalfAdder
    PORT(
         a_i : IN  std_logic;
         b_i : IN  std_logic;
         c_o : OUT  std_logic;
         s_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a_i : std_logic := '0';
   signal b_i : std_logic := '0';

 	--Outputs
   signal c_o : std_logic;
   signal s_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HalfAdder PORT MAP (
          a_i => a_i,
          b_i => b_i,
          c_o => c_o,
          s_o => s_o
        );

   -- Clock process definitions
   -- <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		
		-- a_i <= '0';
		-- b_i <= '0';
		wait for 10 ns;
		
		a_i <= '1';
		wait for 10 ns;
		
		b_i <= '1';
		wait for 10 ns;
		
		a_i <= '0';
		wait for 10 ns;		
      wait;
   end process;

END;
