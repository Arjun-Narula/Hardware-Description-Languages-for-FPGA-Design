library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;
architecture FSM_ARCH of FSM is
type state_type is(A,B,C);
signal PS,NS:state_type;
begin

synch_process:process(CLK,RST,NS)
begin
if (RST='1') then
PS<=A;
elsif(rising_edge(CLK)) then
PS<=NS;
end if;
end process synch_process;

comb_process:process(PS,In1)
begin
Out1<='0';
case PS is

when A=>
Out1<='0';
if (In1='0')then 
NS<=A;
else NS<=B;
end if;

when B=>
Out1<='0';
if(In1='0')then NS<=C;
else NS<=B;
end if;

when C=>
Out1<='1';
if(In1='0')then NS<=C;
else NS<=A;
end if;

when others =>
Out1<='0';
NS<=A;

end case;
end process comb_process;
enD FSM_ARCH;


