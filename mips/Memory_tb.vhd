--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:44:53 05/15/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/mips/Memory_tb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memory
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
 
ENTITY Memory_tb IS
END Memory_tb;
 
ARCHITECTURE behavior OF Memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory
    PORT(
         Clk : IN  std_logic;
         MemRead : IN  std_logic;
         MemWrite : IN  std_logic;
         Address : IN  std_logic_vector(7 downto 0);
         WriteData : IN  std_logic_vector(7 downto 0);
         MemData : OUT  std_logic_vector(7 downto 0);
         Port0 : OUT  std_logic_vector(7 downto 0);
         Port1 : OUT  std_logic_vector(7 downto 0);
         Port2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal MemRead : std_logic := '1';
   signal MemWrite : std_logic := '0';
   signal Address : std_logic_vector(7 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal MemData : std_logic_vector(7 downto 0);
   signal Port0 : std_logic_vector(7 downto 0);
   signal Port1 : std_logic_vector(7 downto 0);
   signal Port2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory PORT MAP (
          Clk => Clk,
          MemRead => MemRead,
          MemWrite => MemWrite,
          Address => Address,
          WriteData => WriteData,
          MemData => MemData,
          Port0 => Port0,
          Port1 => Port1,
          Port2 => Port2
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
		Address <= "11111111";
		MemWrite <= '1';
		WriteData <= "11000011";
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
