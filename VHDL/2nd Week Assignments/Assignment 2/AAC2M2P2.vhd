LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

architecture behavioral of RAM128_32 is 
-- type Decleration 
type Ram_type is array (2**7-1 downto 0) of std_logic_vector (32-1 downto 0);
signal Ram_internal : Ram_type;
begin 
-- prcoess for memory 
Memory_process : process(clock,address,data,wren)
begin 
if ( rising_edge(clock) ) then
    if(wren = '1') then
       Ram_internal(to_integer(unsigned(address))) <= data;
    end if ;
end if ;
q <= Ram_internal(to_integer(unsigned(address)));
end process Memory_process;
end architecture behavioral;