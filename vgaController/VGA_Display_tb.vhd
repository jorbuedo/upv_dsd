--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:16:54 05/24/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/vgaController/VGA_Display_tb.vhd
-- Project Name:  vgaController
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VGA_Display
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
 
ENTITY VGA_Display_tb IS
END VGA_Display_tb;
 
ARCHITECTURE behavior OF VGA_Display_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGA_Display
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Hsync : OUT  std_logic;
         Vsync : OUT  std_logic;
         Red : OUT  std_logic_vector(2 downto 0);
         Green : OUT  std_logic_vector(2 downto 0);
         Blue : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';

 	--Outputs
   signal Hsync : std_logic;
   signal Vsync : std_logic;
   signal Red : std_logic_vector(2 downto 0);
   signal Green : std_logic_vector(2 downto 0);
   signal Blue : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGA_Display PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Hsync => Hsync,
          Vsync => Vsync,
          Red => Red,
          Green => Green,
          Blue => Blue
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

      wait for Clk_period*10;
		Rst <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
