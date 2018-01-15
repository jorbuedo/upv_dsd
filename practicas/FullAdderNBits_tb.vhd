--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:59:21 03/04/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/practicas/FullAdderNBits_tb.vhd
-- Project Name:  practicas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FullAdderNBits
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
 
ENTITY FullAdderNbits_tb IS
END FullAdderNbits_tb;
 
ARCHITECTURE behavior OF FullAdderNbits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FullAdderNBits
    PORT(
         a_i : IN  std_logic_vector(31 downto 0);
         b_i : IN  std_logic_vector(31 downto 0);
         c_i : IN  std_logic;
         c_o : OUT  std_logic;
         s_o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a_i : std_logic_vector(31 downto 0) := (others => '0');
   signal b_i : std_logic_vector(31 downto 0) := (others => '0');
   signal c_i : std_logic := '0';

 	--Outputs
   signal c_o : std_logic;
   signal s_o : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FullAdderNBits PORT MAP (
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

		a_i <= (others => '1');
		wait for 10 ns;
		b_i <= (others => '1');
		wait for 10 ns;
		c_i <= '1';
		wait for 10 ns;
		b_i <= (others => '0');
		wait for 10 ns;
		a_i <= (0 => '1', others => '0');
		wait for 10 ns;
		c_i <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
