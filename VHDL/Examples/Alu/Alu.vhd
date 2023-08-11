library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- Entity 
entity ALU is port 
( 
    Control_Signal  : in  std_logic_vector (2 downto 0);
    First_Operand   : in  std_logic_vector (7 downto 0);
    Seconed_Operand : in  std_logic_vector (7 downto 0);
    ALU_output      : out std_logic_vector (7 downto 0) 
);
end entity ALU;
-- Architecture 
architecture behavioral of ALU is 
signal data : unsigned(7 downto 0 );
begin
ALu_process : process (Control_Signal,First_Operand,Seconed_Operand) 
begin
case_Alu : case Control_Signal is 

     when "000" =>
     data <=  unsigned(First_Operand) + unsigned(Seconed_Operand);
     when "001" =>
     data <=   unsigned(First_Operand) - unsigned(Seconed_Operand);
     when "010" =>      
     data <=   unsigned(First_Operand) * unsigned(Seconed_Operand);
     when "011" =>
     data <=   unsigned(First_Operand) / unsigned(Seconed_Operand);
     when "100" =>
     data <=  shift_left( unsigned(First_Operand),1);
     when "101" =>
     data <=  shift_right( unsigned(First_Operand),1);
     when "110" =>
     data <= shift_left(unsigned(Seconed_Operand),1);
     when "111" =>
     data <= shift_right(unsigned(Seconed_Operand),1);
     when others =>
     data <= x"ff";
end case case_Alu;
ALU_output <= std_logic_vector(data);
end process ALu_process;
end architecture behavioral;