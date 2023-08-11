library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;


architecture FSM_arch of FSM is
type state_type is(A,B,C);
signal state,next_state:state_type;
begin

synch_process:process(CLK,RST,next_state)
begin
if (RST='1') then
state<=A;
elsif(rising_edge(CLK)) then
state<=next_state;
end if;
end process synch_process;

comb_process:process(state,In1)
begin
Out1<='0';
case state is

when A=>
Out1<='0';
if (In1='0')then 
next_state<=A;
else next_state<=B;
end if;

when B=>
Out1<='0';
if(In1='0')then next_state<=C;
else next_state<=B;
end if;

when C=>
Out1<='1';
if(In1='0')then next_state<=C;
else next_state<=A;
end if;

when others =>
Out1<='0';
next_state<=A;

end case;
end process comb_process;
enD FSM_arch;
