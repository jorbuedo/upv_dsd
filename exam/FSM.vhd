----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Mon Jun 10 18:11:44 CEST 2013 
-- Design Name: 
-- Module Name:		FSM - Behavioral
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

entity FSM is
	Port (
		clk		: in	STD_LOGIC;
		rst		: in	STD_LOGIC;
		en		: in	STD_LOGIC;
		c		: in	STD_LOGIC;
		d		: in	STD_LOGIC;
		v		: in	STD_LOGIC;
		total	: out	STD_LOGIC_VECTOR(2 downto 0);
		p		: out	STD_LOGIC;
		m		: out	STD_LOGIC
	);
end FSM;

architecture Behavioral of FSM is
	type FSM_t is (s0,s1,s2,s3,s4,s5,s6);
	signal current_s, next_s	: FSM_t;
begin
	process(clk, rst, en)
	begin
		if(rst = '1') then
			current_s <= s0;
		elsif(clk'event and clk = '1' and en = '1') then
			current_s <= next_s;
		end if;
	end process;

	process(current_s, en)
	begin
			case current_s is
				when s0 =>
					if c = '1' and d = '0' and v = '0' then
						next_s <= s1;
					elsif c = '0' and d = '1' and v = '0' then
						next_s <= s2;
					elsif c = '0' and d = '0' and v = '1' then
						next_s <= s4;
					else
						next_s <= s0;
					end if;
					total <= "000";
					p <= '0';
					m <= '0';
				when s1 =>
					if c = '1' and d = '0' and v = '0' then
						next_s <= s2;
					elsif c = '0' and d = '1' and v = '0' then
						next_s <= s3;
					elsif c = '0' and d = '0' and v = '1' then
						next_s <= s5;
					else
						next_s <= s1;
					end if;
					total <= "001";
					p <= '0';
					m <= '0';
				when s2 =>
					if c = '1' and d = '0' and v = '0' then
						next_s <= s3;
					elsif c = '0' and d = '1' and v = '0' then
						next_s <= s4;
					elsif c = '0' and d = '0' and v = '1' then
						next_s <= s6;
					else
						next_s <= s2;
					end if;
					total <= "010";
					p <= '0';
					m <= '0';
				when s3 =>
					if c = '1' and d = '0' and v = '0' then
						next_s <= s1;
					elsif c = '0' and d = '1' and v = '0' then
						next_s <= s2;
					elsif c = '0' and d = '0' and v = '1' then
						next_s <= s4;
					else
						next_s <= s0;
					end if;
					total <= "011";
					p <= '1';
					m <= '0';
				when s4 =>
					if c = '1' and d = '0' and v = '0' then
						next_s <= s1;
					elsif c = '0' and d = '1' and v = '0' then
						next_s <= s2;
					elsif c = '0' and d = '0' and v = '1' then
						next_s <= s4;
					else
						next_s <= s0;
					end if;
					total <= "100";
					p <= '1';
					m <= '1';
				when s5 =>
					if c = '1' and d = '0' and v = '0' then
						next_s <= s4;
					elsif c = '0' and d = '1' and v = '0' then
						next_s <= s4;
					elsif c = '0' and d = '0' and v = '1' then
						next_s <= s4;
					else
						next_s <= s4;
					end if;
					total <= "101";
					p <= '0';
					m <= '1';
				when s6 =>
					if c = '1' and d = '0' and v = '0' then
						next_s <= s5;
					elsif c = '0' and d = '1' and v = '0' then
						next_s <= s5;
					elsif c = '0' and d = '0' and v = '1' then
						next_s <= s5;
					else
						next_s <= s5;
					end if;
					total <= "110";
					p <= '0';
					m <= '1';
				when others =>
					null;
			end case;
	end process;

end Behavioral;

