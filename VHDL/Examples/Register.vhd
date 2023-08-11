library ieee;
use ieee.std_logic_1164.all;
entity regbit4 is port (
data : in std_logic_vector (3 downto 0) ;
Q    : out std_logic_vector (3 downto 0 ) ;
clk  : in std_logic ;
load : in std_logic ;
rst  : in std_logic 
);
end regbit4 ;

architecture behavioral of regbit4 is 
begin 
 process(clk ,data ,rst)
  begin
    if (rst = '1') then
       Q <= b"0000";
    elsif ( rising_edge(clk) ) then
       if (load = '1' ) then 
         Q <= data ;
      end if ;
    end if ;
  end process ;

end architecture behavioral ;