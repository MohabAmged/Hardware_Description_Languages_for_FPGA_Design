library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Reg_File is 
 generic(
   Address_width : integer := 2;
   Data_width    : integer := 8
 );

port(
      Clk,Write_Enable : in  std_logic ;
      Write_Address    : in  std_logic_vector ( (Address_width - 1) downto 0);
      Read_Address     : in  std_logic_vector ( (Address_width - 1) downto 0);
      Write_Data       : in  std_logic_vector ( (Data_width -1    ) downto 0); 
      Read_Data        : out std_logic_vector ( (Data_width -1    ) downto 0)
) ;
end entity Reg_File;

-- architecture 
architecture behavioral of Reg_File is 
 type array_type is array( (2**Address_width)-1 downto 0 ) of std_logic_vector ( Data_width-1  downto 0 );
 signal Registers_array : array_type ;
begin   
Reg_file_process : process (Clk, Write_Enable, Read_Address, Write_Address , Write_Data)
begin
  if ( rising_edge(Clk)) then
     if( Write_Enable = '1') then
       Registers_array ( to_integer(unsigned(Write_Address) ) ) <= Write_Data ;
     end if;
      Read_Data <= Registers_array ( to_integer( unsigned (Read_Address) ) ) ;
  end if;
end process Reg_file_process;
end architecture behavioral;