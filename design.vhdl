library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity transition_calculator is 
port(clk, load, clear : in std_logic; data : in std_logic_vector(9 downto 0); count : out std_logic_vector(3 downto 0)); 
end transition_calculator; 



architecture css of transition_calculator is 
begin 
pro: process(clear, clk) 
  variable num: std_logic_vector (3 downto 0) := (others => '0');
  begin if(clear = '0') then 
    count <= "0000";
    elsif(clk'event and clk = '1' and load = '1') then 
    num := "0000"; 
    for i in 0 to 8 loop 
      if(data(i) /= data(i+1)) then 
        num := num + '1'; 
  end if;
end loop; 
count <= num; 
end if; 
end process; 
end css;