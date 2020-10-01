-- Behavioural Modeling GCD Algorithm using datapath and control unit
--Author : shifa vahora
library ieee;                                       --library declaration
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity gcd_datapath_algorithm is                     -- entity declaration
port(                                                 --port declaration
      clk : in std_logic;
      clr : in std_logic;
       xmsel : in std_logic_vector(1 downto 0);             --input/output declaration
       ymsel : in std_logic_vector(1 downto 0);
       xin : in std_logic_vector(3 downto 0);
       yin : in std_logic_vector(3 downto 0);
       xld : in std_logic;
       yld : in std_logic;
       gld : in std_logic;
       gcd : out std_logic_vector(3 downto 0);
       eqflag : out std_logic;
       ltflag : out std_logic
);
end gcd_datapath_algorithm;
architecture behaviour of gcd_datapath_algorithm is          --architecture declaration
component mux2G                                              --component declaration
generic(                                                      --generic declaration
  N : integer);
port(
     a : in std_logic_vector(N-1 downto 0);
     b : in std_logic_vector(N-1 downto 0); 
     s : in std_logic;
     y : out std_logic_vector(N-1 downto 0)
);
end component;
component reg
generic(
     N : integer:=8);
port(
      load : in std_logic;
      d: in std_logic_vector(N-1 downto 0);
      clk : in std_logic;
      clr : in std_logic;
      q : out std_logic_vector(N-1 downto 0)
);
end component;
signal x, y, x1.y1, xmy, ymx : std_logic_vector(3 downto 0);    --signal declaration
begin
xmy<=x-y;
ymx<=y-x;
Equal : process(x,y)            --process for euality of two inputs 
begin
   if x=y then                    -- if two inputs are equal than eqflag set to 1 otherwise 0
   eqflag<='1';
  else
   eqflag<='0';
end if;
end process;
Less_than : process(x,y)         
begin
   if x<y then                      --if one input lessthan other input than ltflag set to 1 otherwise 0
   ltflag<='1';
   else
   ltflag<='0';
end if;
end process;
M1 : mux2G
    generic map(                       
          N=4             
);
   portmap(
        a=>xmy, b=>xin,                               -- different component instantiation
        s=>xmsel, y=>x1
);
M2 : mux2G
    generic map(
             N=4
);
     portmap(
          a=>ymx, b=>yin,
          s=>ymsel, y=>y1
);
R1 : reg
       generic map(
            N=4
);
  portmap(load=>xld, d=>x1, clk=>clk, clr=>clr, q=>x);
R2 : reg
       generic map(
            N=4
);
  portmap(load=>yld, d=>y1, clk=>clk, clr=>clr, q=>y);
R3 : reg
       generic map(
            N=4
);
  portmap(load=>gld, d=>x, clk=>clk, clr=>clr, q=>gcd);
end behaviour;
entity gcd_contol_unit is                         --entity declaration for control unit
   port(                                           --port declaration for control unit
       clk : in std_logic;                        --input/output declaration
       clr : in std_logic;
       eqflag : in std_logic;
       ltflag : in std_logic;
       go : in std_logic;
       xmsel : out std_logic;
       ymsel : out std_logic;
       xld : out std_logic;
       yld : out std_logic;
       gld : out std_logic
);
end gcd_control_unit;
architecture behavioural of gcd_control_unit is                      --architecture declaration of contol unit
type state_type is(start, input, test1, test2,update1, update2, done);  --state declaration
signal present_state, next_state : state_type;                            --signal declaration
begin
sreg : process(clk, clr)
begin
     if clr ='1' then
    present_state<=start;
    elsif clk'event and clk='1' then
    present_state<=next_state;
end if;
end process;
C1 : process(present_state, go, eqflag, ltflag)
begin
    case present_state is
    when start=>
     if go = '1'then
    next_state<=input;
   else
    next_state<=start;
end if;
    when input=>
      next_state<=test1;
    when test1=>
     if eqflag ='1'then 
   next_state<=done;
else
      next_state<=test2;
end if;
     when test2=>
    if ltflag ='1' then
     next_state<=update1;
    else
     next_state<=update2;
end if;
      when update1=>
      next_state<=test1;
      when update2=>
       next_state<=test1;
     when done=>
    next_state<=done;
   when others=>
     next_state<=null;
end case;
end process;
C2 : process(persent_state)
begin
    xld <= '0'; yld <='0'; gld <='0';
    xmsel <='0'; ymse<='0';
case prsent_state is
when input=>
       xld <= '1'; yld <='1'; 
    xmsel <='1'; ymse<='1';
when update1=>
      yld <= '1';
when update2=>
     xld <= '1';
when done=>
     gld <= '1';
when others=>
      null;
end case;
end process;
end behavioural;
entity gcd is 
port(
       clk : in std_logic;
       clr : in std_logic;
        go : in std_logic;
      xin : in std_logic_vector(3 downto 0);
       yin : in std_logic_vector(3 downto 0);
     gcd_out : out std_logic_vector(3 downto 0)
);
end gcd;
architecture behave of gcd is
component gcd_datapath_algorithm
port(
      clk : in std_logic;
      clr : in std_logic;
       xmsel : in std_logic;
       ymsel : in std_logic;
       xin : in std_logic_vector(3 downto 0);
       yin : in std_logic_vector(3 downto 0);
       xld : in std_logic;
       yld : in std_logic;
       gld : in std_logic;
       gcd : out std_logic_vector(3 downto 0);
       eqflag : out std_logic;
       ltflag : out std_logic
);
end component;
component gcd_contol_unit is
   port(
       clk : in std_logic;
       clr : in std_logic;
       eqflag : in std_logic;
       ltflag : in std_logic;
       go : in std_logic;
       xmsel : out std_logic;
       ymsel : out std_logic;
       xld : out std_logic;
       yld : out std_logic;
       gld : out std_logic
);
end component;
signal eqflag, ltflag, xmsel, ymsel : std_logic;
signal xld, yld, gld : std_logic;
begin
U1 : gcd_datapath_algorithm
portmap(
      clk =>clk, clr =>clr, xmsel =>xmsel, ymsel=>ymsel, xin =>xin,
      yin =>yin, xld =>xld, yld =>yld, gld =>gld, gcd =>gcd_out, eqflag =>eqflag, ltflg =>ltflag
);
U2 : gcd_control_unit
portmap(clk =>clk, clr =>clr, xmsel =>xmsel, ymsel=>ymsel, xld =>xld,
       yld =>yld, gld =>gld, go =>go, eqflag =>eqflag, ltflg =>ltflag
);
end gcd;
