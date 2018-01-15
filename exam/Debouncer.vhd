----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:27 06/04/2013 
-- Design Name: 
-- Module Name:    Debouncer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Debouncer is
    Port ( rst_i : in  STD_LOGIC;            -- reset
           clk_i : in  STD_LOGIC;            -- clock
           data_i : in  STD_LOGIC;           -- asynchronous data in
           debounced_o : out  STD_LOGIC);    -- synchronous debounced data
end Debouncer;

architecture Behavioral of Debouncer is

   signal q : std_logic_vector(19 downto 0);                          -- It takes about 0.2ms to max at 100MHz
   constant max : std_logic_vector(19 downto 0) := (others => '1');   -- Constant value to compare to

-- Just for simulation
--   signal q : std_logic_vector(3 downto 0);                          -- It takes about 0.04ms to max at 100MHz
--   constant max : std_logic_vector(3 downto 0) := (others => '1');   -- Constant value to compare to

begin

   process(rst_i, clk_i)
   begin
      if rst_i = '1' then
         q <= (others => '0');
      elsif clk_i'event and clk_i = '1' then
         q <= q(18 downto 0) & data_i;
         -- Just for simulation
         -- q <= q(2 downto 0) & data_i;
      end if;
   end process;

   debounced_o <= '1' when q = max else '0';

end Behavioral;

