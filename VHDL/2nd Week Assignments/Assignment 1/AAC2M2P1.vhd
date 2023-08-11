LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:  in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP: in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:   out std_logic_vector(3 downto 0);            			
    TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;


architecture behavioral of AAC2M2P1 is 
signal reg : std_logic_vector(3 downto 0);
begin
Counter_proc : process (CP) 
begin 
if (rising_edge(CP) and SR = '0') then 
-- Reset Action
reg<="0000";
elsif (rising_edge(CP)) then 
if (PE = '0') then
reg <=P;
elsif (PE='1' and CEP ='1' and CET = '1') then 
reg <=std_logic_vector(unsigned(reg)+1);
end if;
end if;
end process Counter_proc; 
Q <= reg;
TC<= reg(3) and reg(2) and reg(1) and reg(0) and CET;


end architecture behavioral;