--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:02:11 03/14/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/tema2/WaterBombs_tb.vhd
-- Project Name:  tema2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WaterBombs
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
 
ENTITY WaterBombs_tb IS
END WaterBombs_tb;
 
ARCHITECTURE behavior OF WaterBombs_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WaterBombs
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         S : IN  std_logic_vector(1 downto 0);
         B : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal S : std_logic_vector(1 downto 0) := (others => '1');

 	--Outputs
   signal B : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WaterBombs PORT MAP (
          rst => rst,
          clk => clk,
          S => S,
          B => B
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
		
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		wait for 10 ns;
		
		S <= "10";
		wait for 10 ns;
		S <= "11";
		wait for 10 ns;
		S <= "10";
		wait for 10 ns;
		S <= "11";
		wait for 10 ns;
		S <= "10";
		wait for 10 ns;
		S <= "11";
		wait for 10 ns;
		S <= "10";
		wait for 10 ns;
		S <= "00";
		wait for 10 ns;
		S <= "10";

      -- insert stimulus here 

      wait;
   end process;

END;
