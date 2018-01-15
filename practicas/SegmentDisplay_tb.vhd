--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:29:32 03/04/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/practicas/SegmentDisplay_tb.vhd
-- Project Name:  practicas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SegmentDisplay
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
 
ENTITY SegmentDisplay_tb IS
END SegmentDisplay_tb;
 
ARCHITECTURE behavior OF SegmentDisplay_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SegmentDisplay
    PORT(
         clk : IN  std_logic;
         enable : IN  std_logic;
         digit : IN  std_logic_vector(15 downto 0);
         segment : OUT  std_logic_vector(7 downto 0);
         active : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal digit : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal segment : std_logic_vector(7 downto 0);
   signal active : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SegmentDisplay PORT MAP (
          clk => clk,
          enable => enable,
          digit => digit,
          segment => segment,
          active => active
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		digit <= (0 => '1', 5 => '1', 10 => '1', 15 => '1', others => '0');
		wait for 10 ns;
		--digit <= (others => '1');
		wait for 10 ns;
		--digit <= (2 => '1', 6 => '1', 10 => '1', 15 => '1', others => '0');
		wait for 15 ns;
		enable <= '1';
		wait for 15 ns;
		--digit <= (0 => '1', 5 => '1', 10 => '1', 15 => '1', others => '0');
		wait for 10 ns;
		--digit <= (others => '1');
		wait for 10 ns;
		--digit <= (1 => '1', 7 => '1', 9 => '1', 15 => '1', others => '0');
		wait for 10 ns;
		enable <= '0';
		wait for 10 ns;
		--digit <= (others => '0');


      wait;
   end process;

END;
