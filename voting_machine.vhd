--Behavioural Modeling of voting machine using finite state machine(FSM)
--Author : shifa vahora
library ieee;
use ieee.std_logic_1164.all;                  --use for logical operators
use ieee.std_logic_arith.all;                 --use for relational and arithmetic operatos 
use ieee.std_logic_unsigned.all;              
entity voting_machine is                      -- entity declaration
port                                          -- port declaration
(
  clk : in std_logic;                        --input and output declarations
  reset : in std_logic;
  party1 : in std_logic;
  party2 : in std_logic;
  party3 : in std_logic;
  select_party : in std_logic;
  count1_op : out std_logic_vector(5 downto 0);
  count2_op : out std_logic_vector(5 downto 0);
  count3_op : out std_logic_vector(5 downto 0)
);
end voting_machine;                            --end entity declarations
architecture behavioural of voting_machine is                  --architecture declaration of voting machine
signal count1,count2,count3 : std_logic_vector(5 downto 0);    -- siganl declaration for interconnection of component 
signal state : std_logic_vector(5 downto 0);
constant initial : std_logic_vector(5 downto 0):="000001";     --constant declaration
constant check : std_logic_vector(5 downto 0):="000010";
constant party1_state : std_logic_vector(5 downto 0):="000100";
constant party2_state : std_logic_vector(5 downto 0):="001000";
constant party3_state : std_logic_vector(5 downto 0):="010000";
constant done : std_logic_vector(5 downto 0):="100000";
begin                                                             
process(clk,reset,party1,party2,party3)                    --process declaration(process starts form here)
begin
if(reset='1')then                                          -- reset for initial count = 0
count1<=(others=>'0');
count2<=(others=>'0');
count3<=(others=>'0');
state<=initial;
else
if(rising_edge(clk)and reset='0')then
case state is                                            --case statement starts 
when initial=>                                           --initial state for checking any input if '1' then goes to check state else in initial state
--NSL
if(party1='1' or party2 ='1' or party3 ='1')then
state<=check;
else
state<=initial;
end if;
when check=>                               -- check state for counting vote for 3 parties 
--NSL
if(party1='1')then                         -- if party1 = 1 then goes to party1_state else check for other party
state<=party1_state;
elsif(party2='1')then                      -- if party2 = 1 then goes to party2_state else check for other party
state<=party2_state;
elsif(party3='1')then                      --if party3 = 1 then goes to party3_state else check for other party
state<=party3_state;         
else
state<=check;
end if;
when party1_state=>
--OFL
if(select_party='1')then                 -- if select_party = 1 then  goes to done else check other inputs
state<=done;
else
state<=party1_state;
end if;
count1<=count1+1;                        -- if 1 than increment the counter           
when party2_state=>
if(select_party='1')then
state<=done;
else
state<=party2_state;
end if;
count2<=count2+1;
when party3_state=>
if(select_party='1')then
state<=done;
else
state<=party3_state;
end if;
count3<=count3+1;
when done=>
state<=initial;
when others=>
state<=initial;
end case;                          -- end case statement
end if;                            -- end if statement 
end if;
end process;                       --end process
count1_op<=count1;                 -- signal declare to final output 
count2_op<=count2;
count3_op<=count3;
end architecture behavioural;        -- end architecture


 