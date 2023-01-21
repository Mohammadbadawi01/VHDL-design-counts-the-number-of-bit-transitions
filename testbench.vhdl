library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity UN is
end UN;

architecture bodyy of UN is

signal clk : std_logic := '0';
signal load: std_logic := '0';
signal clear : std_logic := '0';
signal data : std_logic_vector (9 downto 0) := (others => '0');
signal count : std_logic_vector (3 downto 0) := (others => '0');

constant timeing : time := 10 ns;

component transition_calculator 
port(clk, load, clear: in std_logic;
data : in std_logic_vector(9 downto 0);
count : out std_logic_vector(3 downto 0));
end component;

begin
COU: transition_calculator
port map (clk => clk,
load => load,
clear => clear,
data => data,
count => count);

process	begin

clear <= '0';
wait for timeing*2;

 clear <= '1';
load <= '1';
for i in 1 to 1024 loop
 wait for timeing * 2;


data <= data + '1';
end loop;

data <= "0111011001";
load <= '0';
wait for timeing * 4;
wait;
end process;

process	begin
clk <= '1';
wait for timeing / 2;
clk <= '0';
wait for timeing / 2;
end process;

end bodyy;