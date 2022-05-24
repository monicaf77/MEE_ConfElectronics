library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clock_divider is
generic(div_factor: integer :=50000);
port ( clk,reset: in std_logic;
clock_out: out std_logic);
end clock_divider;
  
architecture bhv of clock_divider is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset)
begin
if(reset='0') then
count<=1;
tmp<='0';
elsif(clk'event and clk='1') then
count <=count+1;
if (count = div_factor/2) then
tmp <= NOT tmp;
count <= 1;
end if;
end if;
clock_out <= tmp;
end process;
  
end bhv;
