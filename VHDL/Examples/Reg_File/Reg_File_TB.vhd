library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Reg_File_Tb is 
end entity Reg_File_Tb;

architecture Reg_TestBench of Reg_File_Tb is
component Reg_File 
generic 
      ( 
           Address_width : integer := 4;
           Data_width    : integer := 8
       );
port 
   (
      Clk,Write_Enable : in  std_logic ;
      Write_Address    : in  std_logic_vector ( (Address_width - 1) downto 0);
      Read_Address     : in  std_logic_vector ( (Address_width - 1) downto 0);
      Write_Data       : in  std_logic_vector ( (Data_width -1    ) downto 0); 
      Read_Data        : out std_logic_vector ( (Data_width -1    ) downto 0)
    ) ; 
    end component Reg_File;

-- Consatnts 
constant T : time := 20 ns; 
constant D_width : integer :=8;
constant A_width : integer :=4;
-- signals 
signal Read_Data_TB           :  std_logic_vector ( (D_width -1    ) downto 0);
signal Clk_TB,Write_Enable_TB :  std_logic :='0';
signal Write_Address_TB       :  std_logic_vector ( (A_width - 1)    downto 0);
signal Read_Address_TB        :  std_logic_vector ( (A_width - 1)    downto 0);
signal Write_Data_TB          :  std_logic_vector ( (D_width -1    ) downto 0); 

begin

DUT: Reg_File 
generic map ( 
    Address_width => 4,
    Data_width => 8
)
port map (
    Clk=>Clk_TB,
    Write_Enable=>Write_Enable_TB,
    Write_Address=>Write_Address_TB,
    Read_Address=>Read_Address_TB,
    Write_Data=>Write_Data_TB,
    Read_Data=>Read_Data_TB
);

clk_gen : process begin
Clk_TB<='0';
wait for T/2 ;
Clk_TB<='1';
wait for T/2 ;
end process clk_gen;

Writing_process : process 
variable data : integer :=10;
begin
Write_Data_TB<=std_logic_vector(to_unsigned(data,8));
Read_Address_TB <=std_logic_vector(to_unsigned(0, 4));
Write_Address_TB<=std_logic_vector(to_unsigned(0, 4));
writing_loop : for count in 0 to 2**A_width-1 loop
-- Enable Writing 
Write_Enable_TB<='1';
Write_Address_TB<=std_logic_vector(to_unsigned(count, 4));
Read_Address_TB <=std_logic_vector(to_unsigned(count, 4));
Write_Data_TB<= std_logic_vector(to_unsigned(data,8));
wait for 20 ns;
Write_Enable_TB<='0';
wait for 19 ns;
data :=data+1;
end loop writing_loop;
end process Writing_process;

--reading_process : process begin

--reading_loop : for count_read in 0 to 2**Address_width-1 loop 




--end loop reading_loop;


--end process reading_process;


end architecture Reg_TestBench;