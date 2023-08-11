library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- Entity 
entity Alu_tb is
end entity Alu_tb;
--Architecture 
architecture Alu_TestBench of Alu_tb is 
-- Component Decleration
component ALU is port 
( 
    Control_Signal  : in  std_logic_vector (2 downto 0);
    First_Operand   : in  std_logic_vector (7 downto 0);
    Seconed_Operand : in  std_logic_vector (7 downto 0);
    ALU_output      : out std_logic_vector (7 downto 0) 
);
end component ALU;

-- Constants 
constant T : time := 20 ns;

--Signals 
signal    Control_Signal_TB  :  std_logic_vector (2 downto 0);
signal    First_Operand_TB   :  std_logic_vector (7 downto 0);
signal    Seconed_Operand_TB :  std_logic_vector (7 downto 0);
signal    ALU_output_TB      :  std_logic_vector (7 downto 0);
signal    clock              :  std_logic :='0';

begin 

DUT: ALU port map 
( 
    Control_Signal=>Control_Signal_TB,
    First_Operand=>First_Operand_TB,
    Seconed_Operand=>Seconed_Operand_TB,
    ALU_output=>ALU_output_TB
);


clock_process : process begin
clock<= not clock ;
wait for T/2 ;
end process clock_process;

Testing_prcoss : process begin
First_Operand_TB <="00001010";
Seconed_Operand_TB <="00000101";
Control_loop: for count in 0 to 7 loop 
Control_Signal_TB<=std_logic_vector(to_unsigned(count,3));
wait for T/2;
end loop Control_loop;
end process Testing_prcoss;





end architecture Alu_TestBench;