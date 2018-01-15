----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:36 06/04/2013 
-- Design Name: 
-- Module Name:    TopModule - Behavioral 
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

entity TopModule is
    Port ( rst_i : in  STD_LOGIC;                                 -- reset
           clk_i : in  STD_LOGIC;                                 -- clock
           v_i : in  STD_LOGIC;                                   -- 0.20€ coin
           d_i : in  STD_LOGIC;                                   -- 0.10€ coin
           c_i : in  STD_LOGIC;                                   -- 0.05€ coin
           p_o : out  STD_LOGIC;                                  -- return product
           m_o : out  STD_LOGIC;                                  -- return 0.05€ coin
           en_n_o : out  STD_LOGIC_VECTOR (3 downto 0);           -- 7 segment display enable
           display_n_o : out  STD_LOGIC_VECTOR (6 downto 0));     -- 7 segment display leds
end TopModule;

architecture Behavioral of TopModule is

component FSM is
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
end component;


component ClockDivider is
    Generic (DIVIDE : integer := 2);
    Port ( rst_i : in  STD_LOGIC;            -- reset
           clk_i : in  STD_LOGIC;            -- clock
           clk_div_o : out  STD_LOGIC);      -- divided clock
end component;

component Debouncer is
    Port ( rst_i : in  STD_LOGIC;            -- reset
           clk_i : in  STD_LOGIC;            -- clock
           data_i : in  STD_LOGIC;           -- asynchronous data in
           debounced_o : out  STD_LOGIC);    -- synchronous debounced data
end component;

   
component DisplaysManager is
    Port ( rst_i : in  STD_LOGIC;                        -- reset
           clk_i : in  STD_LOGIC;                        -- clock
           en_i : in  STD_LOGIC;                         -- enable
           a_i : in  STD_LOGIC_VECTOR (3 downto 0);      -- first data
           b_i : in  STD_LOGIC_VECTOR (3 downto 0);      -- second data
           c_i : in  STD_LOGIC_VECTOR (3 downto 0);      -- third data
           d_i : in  STD_LOGIC_VECTOR (3 downto 0);      -- fourth data
           en_n_o : out  STD_LOGIC_VECTOR (3 downto 0);  -- display enabled
           hex_o : out  STD_LOGIC_VECTOR (3 downto 0));  -- data to be shown on the display enabled
end component;

component Display7Segments is
    Port ( hex_i : in  STD_LOGIC_VECTOR (3 downto 0);       -- number to be displayed
           leds_n_o : out  STD_LOGIC_VECTOR (6 downto 0));  -- activation of the proper leds
end component;

signal s_hex_o		: STD_LOGIC_VECTOR(3 downto 0);
signal s_c			: STD_LOGIC;
signal s_d			: STD_LOGIC;
signal s_v			: STD_LOGIC;
signal s_clk_div_0	: STD_LOGIC;
signal s_clk_div_1	: STD_LOGIC;
signal s_total		: STD_LOGIC_VECTOR(2 downto 0);
signal s_units		: STD_LOGIC_VECTOR(3 downto 0);
signal s_tens		: STD_LOGIC_VECTOR(3 downto 0);
begin

with s_total select
	s_units <= 	"0000" when "000",
				"0101" when "001",
				"0000" when "010",
				"0101" when "011",
				"0000" when "100",
				"0101" when "101",
				"0000" when "110",
				(others => '0') when others;

with s_total select
	s_tens <= 	"0000" when "000",
				"0000" when "001",
				"0001" when "010",
				"0001" when "011",
				"0010" when "100",
				"0010" when "101",
				"0011" when "110",
				(others => '0') when others;

FSM_0 : FSM
	port map (
		clk		 => clk_i,
		rst		 => rst_i,
		en		 => s_clk_div_0,
		c		 => s_c,
		d		 => s_d,
		v		 => s_v,
		total	 => s_total,
		p		 => p_o,
		m		 => m_o
	);

Debouncer_0 : Debouncer
    port map (
    		rst_i  => rst_i,
           clk_i  => clk_i,
           data_i  => c_i,
           debounced_o  => s_c );

Debouncer_1 : Debouncer
    port map (
    		rst_i  => rst_i,
           clk_i  => clk_i,
           data_i  => d_i,
           debounced_o  => s_d );

Debouncer_2 : Debouncer
    port map (
    		rst_i  => rst_i,
           clk_i  => clk_i,
           data_i  => v_i,
           debounced_o  => s_v );

ClockDivider_0 : ClockDivider
    generic map (DIVIDE  => 100000000)
    port map (
			rst_i  => rst_i,
           	clk_i  => clk_i,
           	clk_div_o  => s_clk_div_0 );

ClockDivider_1 : ClockDivider
    generic map (DIVIDE  => 2500)
    port map (
			rst_i  => rst_i,
           	clk_i  => clk_i,
           	clk_div_o  => s_clk_div_1 );

DisplaysManager_0 : DisplaysManager
    port map (
			rst_i  => rst_i,
           clk_i  => clk_i,
           en_i  => s_clk_div_1,
           a_i  => s_units,
           b_i  => s_tens,
           c_i  => "0000",
           d_i  => "0000",
           en_n_o  => en_n_o,
           hex_o  => s_hex_o );

Display7Segments_0 : Display7Segments
    port map (
			hex_i  => s_hex_o,
           	leds_n_o  => display_n_o );

end Behavioral;

