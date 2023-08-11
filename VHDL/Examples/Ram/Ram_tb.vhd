library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Ram_TB is 
end entity Ram_TB;

architecture Ram_TestBench of Ram_TB is 

component  RamGeneric is 
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
end component RamGeneric;

-- Consatnts 
constant A_Width_tb : integer := 7;
constant D_Width_tb : integer := 8;
constant T          : time    := 20 ns ;

 signal address_TB :   std_logic_vector (A_Width_tb-1 downto 0);          
 signal clock_TB   :   std_logic :='1';
 signal data_TB    :   std_logic_vector (D_Width_tb-1 downto 0);
 signal wren_TB    :   std_logic;
 signal q_TB       :   std_logic_vector (D_Width_tb-1 downto 0);

begin 

DUT : RamGeneric 
generic map (
    Address_width => 7 ,
    Data_width => 8
)
port map (
    address=>address_TB, 
    clock => clock_TB,  
    data  => data_TB,  
    wren  => wren_TB, 
    q     => q_TB 

);

clock_process : process begin 
clock_TB <= not clock_TB;
 wait for T/2 ;
end process clock_process;

Writing_process : process 
variable  data_int : integer :=0 ;  
begin 
data_int:=10;
writing_loop : for count in 0 to 2**A_Width_tb-1 loop
wren_TB<='1';
address_TB<= std_logic_vector(to_unsigned(count,A_Width_tb));
data_TB<=std_logic_vector(to_unsigned(data_int,D_Width_tb));
data_int:=data_int+1;
wait for 20 ns ;
wren_TB<='0';
wait for 19 ns ;
end loop writing_loop;









end process Writing_process;







end architecture Ram_TestBench;