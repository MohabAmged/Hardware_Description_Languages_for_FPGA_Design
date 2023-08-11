library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RamGeneric is 
generic ( 
           Address_width : integer :=7;
           Data_width    : integer :=8
);
port (
           address : in  std_logic_vector (Address_width-1 downto 0);          
           clock   : in  std_logic;
           data    : in  std_logic_vector (Data_width-1 downto 0);
           wren    : in  std_logic;
           q       : out std_logic_vector (Data_width-1 downto 0)

);
end entity RamGeneric;

architecture behavioral of RamGeneric is 
-- type Decleration 
type Ram_type is array (2**Address_width-1 downto 0) of std_logic_vector (Data_width-1 downto 0);
signal Ram_internal : Ram_type;
signal Last_Address : std_logic_vector (Address_width-1 downto 0);
begin 
-- prcoess for memory 
Memory_process : process(clock,address,data,wren)
begin 
if ( rising_edge(clock) ) then
    if(wren = '1') then
       Ram_internal(to_integer(unsigned(address))) <= data;
    else 
       Last_Address<= address;
    end if ;
       q <= Ram_internal(to_integer(unsigned(Last_Address)));
end if ;
end process Memory_process;

end architecture behavioral;