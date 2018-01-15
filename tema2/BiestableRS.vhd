----------------------------------------------------------------------------------
-- Company: 
-- Engineer:         Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:      Wed Mar  6 12:32:12 CET 2013 
-- Design Name: 
-- Module Name:      BiestableRS - Behavioral
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

entity BiestableRS is
    Port ( 
        r : in  STD_LOGIC;
        s : in  STD_LOGIC;
        q : out  STD_LOGIC;
        q_n : out  STD_LOGIC
    );
end BiestableRS;

architecture Behavioral of BiestableRS is

	signal q_aux, q_n_aux	: STD_LOGIC;

begin

	q_aux <= r nor q_n_aux;
	q_n_aux <= s nor q_aux;

	q <= q_aux;
	q_n <= q_n_aux;

end Behavioral;

