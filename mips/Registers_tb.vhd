--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:05:13 05/05/2013
-- Design Name:   
-- Module Name:   /home/jorbuedo/DSD/mips/Registers_tb.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Registers
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
 
ENTITY Registers_tb IS
END Registers_tb;
 
ARCHITECTURE behavior OF Registers_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Registers
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         RegWrite : IN  std_logic;
         ReadRegister1 : IN  std_logic_vector(4 downto 0);
         ReadRegister2 : IN  std_logic_vector(4 downto 0);
         WriteRegister : IN  std_logic_vector(4 downto 0);
         WriteData : IN  std_logic_vector(7 downto 0);
         ReadData1 : OUT  std_logic_vector(7 downto 0);
         ReadData2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal RegWrite : std_logic := '0';
   signal ReadRegister1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ReadRegister2 : std_logic_vector(4 downto 0) := (others => '0');
   signal WriteRegister : std_logic_vector(4 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ReadData1 : std_logic_vector(7 downto 0);
   signal ReadData2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Registers PORT MAP (
          Clk => Clk,
          Rst => Rst,
          RegWrite => RegWrite,
          ReadRegister1 => ReadRegister1,
          ReadRegister2 => ReadRegister2,
          WriteRegister => WriteRegister,
          WriteData => WriteData,
          ReadData1 => ReadData1,
          ReadData2 => ReadData2
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
	wait for 50 ns;
		Rst <= '1';
	wait for 50 ns;
		Rst <= '0';
		ReadRegister1 <= "00100";
		ReadRegister2 <= "00000";
	wait for 10 ns;
		RegWrite <= '1';
		WriteRegister <= "00000";
		WriteData <= "01010101";
	wait for 10 ns;
		RegWrite <= '0';
		ReadRegister1 <= "00100";
		ReadRegister2 <= "00000";
		

	wait for Clk_period*10;

      -- insert stimulus here 

	wait;
	end process;

END;
