library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity BinaryCounter4 is port (

  Rst  : in  std_logic;
  Load : in  std_logic;
  En   : in  std_logic;
  Clk  : in  std_logic;
  Data : in  std_logic_vector (3 downto 0);
  Q    : out std_logic_vector (3 downto 0) 
);
end entity BinaryCounter4;

-- Archticture 

architecture behavioral of BinaryCounter4 is 
begin
  count_proc : process (Clk,Rst,Load,En)
  begin
    if( Rst = '1') then
       Q <= b"0000"; -- Asynchronas Reset 
    elsif( rising_edge(Clk) ) then
            if ( Load = '1' )  then
               -- load Value Into The Counter
                  Q <= Data; 
            elsif ( En = '1' ) then
              Q <= Q + 1; -- If Enable is High Count 
            end if;
    end if;
  end process count_proc; 
end architecture behavioral;