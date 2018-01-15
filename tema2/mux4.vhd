----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Wed Feb 20 12:46:10 CET 2013 
-- Design Name: 
-- Module Name:      mux4 - structural
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
--use IEEE.NUMERIC_STD.ALL;

entity mux4 is
   Port ( 
         a     : in  STD_LOGIC;
         b     : in  STD_LOGIC;
         c     : in  STD_LOGIC;
         d     : in  STD_LOGIC;
         sel   : in  STD_LOGIC_VECTOR(1 downto 0);
         y     : out  STD_LOGIC
   );
end mux4;

-- architecture structural of mux4 is
--    component mux2 is
--       Port (
--             a : in  STD_LOGIC;
--             b : in  STD_LOGIC;
--             mux_sel : in  STD_LOGIC;
--             y : out  STD_LOGIC
--       );
--    end component;
--    
--    signal mux1_out, mux2_out : STD_LOGIC;
-- begin
--    mux_uno : mux2 port map (
--       a => a,
--       b => b,
--       mux_sel => sel[0],
--       y => mux1_out
--    );
-- 
--    mux_dos : mux2 port map (
--       a => c,
--       b => d,
--       mux_sel => sel[0],
--       y => mux2_out
--    );
-- 
--    muxsel : mux2 port map (
--       a => mux1_out,
--       b => mux2_out,
--       mux_sel => sel[1],
--       y => y
--    );
-- 
-- end structural;

architecture Behavior of mux4 is
begin
	process(a, b, c, d, sel)
	begin
		case sel is
			when "00" => y <= a;
			when "01" => y <= b;
			when "10" => y <= c;
			when "11" => y <= d;
			when others => null;
		end case;
	end process;
end Behavior;

