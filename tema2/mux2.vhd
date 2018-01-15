----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:55 02/16/2013 
-- Design Name: 
-- Module Name:    mux2 - Structural
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

entity mux2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           mux_sel : in  STD_LOGIC;
           y : out  STD_LOGIC);
end mux2;

architecture Structural of mux2 is

	component andgate2 is 
	port ( a, b: in std_logic;
			y : out std_logic);
	end component;

	component orgate2 is 
	port ( a, b: in std_logic;
			y : out std_logic);
	end component;

	component invgate is 
	port ( a: in std_logic;
			y : out std_logic);
	end component;

	signal inv_out, and1_out, and2_out : std_logic;

begin

	inv1 : invgate port map (
		a => mux_sel,
		y => inv_out
		);
		
	and1 : andgate2 port map (
		a => a,
		b => inv_out,
		y => and1_out
		);

	and11 : andgate2 port map (
		a => b,
		b => mux_sel,
		y => and2_out
		);
	
	or1 : orgate2 port map (
		a => and1_out,
		b => and2_out,
		y => y
		);	

end Structural;
