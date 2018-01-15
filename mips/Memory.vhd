----------------------------------------------------------------------------------
-- Company: 
-- Engineer:		Jordi Bueno - jorbuedo@me.com
-- 
-- Create Date:		Sat Apr 27 12:40:14 CEST 2013 
-- Design Name: 
-- Module Name:		Memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity Memory is
	Port (
		Clk			: in	STD_LOGIC;
		MemRead		: in	STD_LOGIC;
		MemWrite	: in	STD_LOGIC;
		Address		: in	STD_LOGIC_VECTOR(7 downto 0);
		WriteData	: in	STD_LOGIC_VECTOR(7 downto 0);
		MemData		: out	STD_LOGIC_VECTOR(7 downto 0);
		Port0		: out	STD_LOGIC_VECTOR(7 downto 0);
		Port1		: out	STD_LOGIC_VECTOR(7 downto 0);
		Port2		: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end Memory;

architecture Behavioral of Memory is
	type Memory_t is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal Memory_s : Memory_t := (
		x"20", -- 0 addi $3, $0, 8
		x"03", -- 1
		x"00", -- 2
		x"0C", -- 3 
		x"A0", -- 4 sb $3, 255($0)
		x"03", -- 5
		x"00", -- 6
		x"FF", -- 7 
		x"20", -- 8 addi $4, $0, 1
		x"04", -- 9
		x"00", -- 10
		x"01", -- 11 
		x"A0", -- 12 sb $4, 254($0)
		x"04", -- 13
		x"00", -- 14
		x"FE", -- 15 
		x"20", -- 16 addi $5, $0, -1
		x"05", -- 17
		x"FF", -- 18
		x"FF", -- 19 
		x"A0", -- 20 sb $5, 253($0)
		x"05", -- 21
		x"00", -- 22
		x"FD", -- 23 
		x"10", -- 24 beq $3, $0, fin
		x"60", -- 25
		x"00", -- 26
		x"1D", -- 27 
		x"00", -- 28 add $4, $4, $5
		x"85", -- 29
		x"20", -- 30
		x"20", -- 31 
		x"A0", -- 32 sb $4, 254($0)
		x"04", -- 33
		x"00", -- 34
		x"FE", -- 35 
		x"00", -- 36 sub $5, $4, $5
		x"85", -- 37
		x"28", -- 38
		x"22", -- 39 
		x"A0", -- 40 sb $5, 253($0)
		x"05", -- 41
		x"00", -- 42
		x"FD", -- 43 
		x"20", -- 44 addi $3, $3, -1
		x"63", -- 45
		x"FF", -- 46
		x"FF", -- 47
		x"A0", -- 48 sb $3, 255($0)
		x"03", -- 49
		x"00", -- 50
		x"FF", -- 51
		x"08", -- 52 j bucle
		x"00", -- 53
		x"00", -- 54
		x"06", -- 55
		x"A0", -- 56 sb $4, 254($0)
		x"04", -- 57
		x"00", -- 58
		x"FE", -- 59
		x"00", -- 60 nop
		x"00", -- 61 nop
		x"00", -- 62 nop
		x"00", -- 63 nop
		x"00", -- 64 nop
		x"00", -- 65 nop
		x"00", -- 66 nop
		x"00", -- 67 nop
		x"00", -- 68 nop
		x"00", -- 69 nop
		x"00", -- 70 nop
		x"00", -- 71 nop
		x"00", -- 72 nop
		x"00", -- 73 nop
		x"00", -- 74 nop
		x"00", -- 75 nop
		x"00", -- 76 nop
		x"00", -- 77 nop
		x"00", -- 78 nop
		x"00", -- 79 nop
		x"00", -- 80 nop
		x"00", -- 81 nop
		x"00", -- 82 nop
		x"00", -- 83 nop
		x"00", -- 84 nop
		x"00", -- 85 nop
		x"00", -- 86 nop
		x"00", -- 87 nop
		x"00", -- 99 nop
		x"00", -- 89 nop
		x"00", -- 90 nop
		x"00", -- 91 nop
		x"00", -- 92 nop
		x"00", -- 93 nop
		x"00", -- 94 nop
		x"00", -- 95 nop
		x"00", -- 96 nop
		x"00", -- 97 nop
		x"00", -- 98 nop
		x"00", -- 99 nop
		x"00", -- 100 nop
		x"00", -- 101 nop
		x"00", -- 102 nop
		x"00", -- 103 nop
		x"00", -- 104 nop
		x"00", -- 105 nop
		x"00", -- 106 nop
		x"00", -- 107 nop
		x"00", -- 108 nop
		x"00", -- 109 nop
		x"00", -- 110 nop
		x"00", -- 111 nop
		x"00", -- 112 nop
		x"00", -- 113 nop
		x"00", -- 114 nop
		x"00", -- 115 nop
		x"00", -- 116 nop
		x"00", -- 117 nop
		x"00", -- 118 nop
		x"00", -- 119 nop
		x"00", -- 120 nop
		x"00", -- 121 nop
		x"00", -- 122 nop
		x"00", -- 123 nop
		x"00", -- 124 nop
		x"00", -- 125 nop
		x"00", -- 126 nop
		x"00", -- 127 nop
		x"00", -- 128 nop
		x"00", -- 129 nop
		x"00", -- 130 nop
		x"00", -- 131 nop
		x"00", -- 132 nop
		x"00", -- 133 nop
		x"00", -- 134 nop
		x"00", -- 135 nop
		x"00", -- 136 nop
		x"00", -- 137 nop
		x"00", -- 138 nop
		x"00", -- 139 nop
		x"00", -- 140 nop
		x"00", -- 141 nop
		x"00", -- 142 nop
		x"00", -- 143 nop
		x"00", -- 144 nop
		x"00", -- 145 nop
		x"00", -- 146 nop
		x"00", -- 147 nop
		x"00", -- 148 nop
		x"00", -- 149 nop
		x"00", -- 150 nop
		x"00", -- 151 nop
		x"00", -- 152 nop
		x"00", -- 153 nop
		x"00", -- 154 nop
		x"00", -- 155 nop
		x"00", -- 156 nop
		x"00", -- 157 nop
		x"00", -- 158 nop
		x"00", -- 159 nop
		x"00", -- 160 nop
		x"00", -- 161 nop
		x"00", -- 162 nop
		x"00", -- 163 nop
		x"00", -- 164 nop
		x"00", -- 165 nop
		x"00", -- 166 nop
		x"00", -- 167 nop
		x"00", -- 168 nop
		x"00", -- 169 nop
		x"00", -- 170 nop
		x"00", -- 171 nop
		x"00", -- 172 nop
		x"00", -- 173 nop
		x"00", -- 174 nop
		x"00", -- 175 nop
		x"00", -- 176 nop
		x"00", -- 177 nop
		x"00", -- 178 nop
		x"00", -- 179 nop
		x"00", -- 180 nop
		x"00", -- 181 nop
		x"00", -- 182 nop
		x"00", -- 183 nop
		x"00", -- 184 nop
		x"00", -- 185 nop
		x"00", -- 186 nop
		x"00", -- 187 nop
		x"00", -- 188 nop
		x"00", -- 189 nop
		x"00", -- 190 nop
		x"00", -- 191 nop
		x"00", -- 192 nop
		x"00", -- 193 nop
		x"00", -- 194 nop
		x"00", -- 195 nop
		x"00", -- 196 nop
		x"00", -- 197 nop
		x"00", -- 198 nop
		x"00", -- 199 nop
		x"00", -- 200 nop
		x"00", -- 201 nop
		x"00", -- 202 nop
		x"00", -- 203 nop
		x"00", -- 204 nop
		x"00", -- 205 nop
		x"00", -- 206 nop
		x"00", -- 207 nop
		x"00", -- 208 nop
		x"00", -- 209 nop
		x"00", -- 210 nop
		x"00", -- 211 nop
		x"00", -- 212 nop
		x"00", -- 213 nop
		x"00", -- 214 nop
		x"00", -- 215 nop
		x"00", -- 216 nop
		x"00", -- 217 nop
		x"00", -- 218 nop
		x"00", -- 219 nop
		x"00", -- 220 nop
		x"00", -- 221 nop
		x"00", -- 222 nop
		x"00", -- 223 nop
		x"00", -- 224 nop
		x"00", -- 225 nop
		x"00", -- 226 nop
		x"00", -- 227 nop
		x"00", -- 228 nop
		x"00", -- 229 nop
		x"00", -- 230 nop
		x"00", -- 231 nop
		x"00", -- 232 nop
		x"00", -- 233 nop
		x"00", -- 234 nop
		x"00", -- 235 nop
		x"00", -- 236 nop
		x"00", -- 237 nop
		x"00", -- 238 nop
		x"00", -- 239 nop
		x"00", -- 240 nop
		x"00", -- 241 nop
		x"00", -- 242 nop
		x"00", -- 243 nop
		x"00", -- 244 nop
		x"00", -- 245 nop
		x"00", -- 246 nop
		x"00", -- 247 nop
		x"00", -- 248 nop
		x"00", -- 249 nop
		x"00", -- 250 nop
		x"00", -- 251 nop
		x"00", -- 252 nop
		x"00", -- 253 nop
		x"00", -- 254 nop
		x"00"  -- 255 nop
   ); 
	signal MemData_s : STD_LOGIC_VECTOR(7 downto 0);
begin
	process(Clk, MemRead, Address, Memory_s)
	begin
		MemData_s <= (others => '0');
		if(MemRead = '1') then
			MemData_s <= Memory_s(to_integer(unsigned(Address)));
		elsif(Clk'event and Clk = '1') then
			if(MemWrite = '1') then
				Memory_s(to_integer(unsigned(Address))) <= WriteData;
			end if;
		end if;
	end process;
	MemData <= MemData_s;
	Port0 <= Memory_s(253);
	Port1 <= Memory_s(254);
	Port2 <= Memory_s(255);
end Behavioral;


architecture Structural of Memory is

component BlockRAM is
	port (
		clka	: in	STD_LOGIC;
		wea		: in	STD_LOGIC_VECTOR(0 downto 0);
		addra	: in	STD_LOGIC_VECTOR(7 downto 0);
		dina	: in	STD_LOGIC_VECTOR(7 downto 0);
		douta	: out	STD_LOGIC_VECTOR(7 downto 0)
	);
end component;
	signal MemData_s	: STD_LOGIC_VECTOR(7 downto 0);
	signal MemWrite_s	: STD_LOGIC_VECTOR(0 downto 0);
begin
	MemWrite_s(0) <= MemWrite;
	process(Clk, Address, MemRead, MemWrite)
	begin
		MemData <= (others=>'0');
		if(MemRead = '1') then
			MemData <= MemData_s;
		end if;
		if(MemWrite = '1' and Clk'event and Clk = '1') then
			if(Address = "11111101") then 
				Port0 <= WriteData;
			end if;
			if(Address = "11111110") then 
				Port1 <= WriteData;
			end if;
			if(Address = "11111111") then 
				Port2 <= WriteData;
			end if;
		end if;
	end process;

	BlockRAM_0 : BlockRAM
	port map(
		clka	=> Clk,
		wea		=> MemWrite_s,
		addra	=> Address,
		dina	=> WriteData,
		douta	=> MemData_s
	);
end Structural;
