--Behavioural Modeling of voting_machine(test bench)
-- Author : shifa vahora
entity voting_machine_tb is                            --entity declaration
end voting_machine_tb;
architecture behaviour of voting_machine_tb is         -- architecture declaration
component voting_machine                               --component declaration
port( clk:in bit;                                      --port declaration
      reset: in bit;
      party1: in bit;
      party2: in bit;
      party3: in bit;
      select_party: in bit;
      count1_op : out bit_vector(5 downto 0);
      count2_op : out bit_vector(5 downto 0);
      count3_op : out bit_vector(5 downto 0));
end component;
signal clk: bit:='0';                                -- signal declaration
signal reset: bit:='0'; 
signal party1: bit:='0'; 
signal party2: bit:='0'; 
signal party3: bit:='0'; 
signal select_party: bit:='0'; 
signal count1_op: bit:='0'; 
signal count2_op: bit:='0'; 
signal count3_op: bit:='0';
constant clk_period : time:=5ns;                     -- consatant declaration
begin
uut: voting_machine                                   -- module instantiation 
port map(
clk=>clk,
reset=>reset,
party1=>party1,
party2=>party2,
party3=>party3,
select_party=>select_party,
count1_op=>count1_op,
count2_op=>count2_op,
count3_op=>count3_op
);
clk proc : process                               --process for clock generation
begin
clk<='0';
wait for clk_period/2;                         -- sequential body of clock generation
clk<='1';
wait for clk_period/2;
end process;
stim proc : process                             --process for applying differnt inputs.
begin
wait for 100ns;
wait for clk_period*10;
reset<='1';
wait for 10ns;                                 -- wait for 10ns
reset<='0';
party1<='0';                                    -- give different inputs to the module
party2<='0';
party3<='0';
party1<='1';
wait for 10ns;
party1<='0';
wait for 10ns;
select_party<='1';
wait for 10ns;
select_party<='0';
wait for 10ns;
party1<='1';
wait for 10ns;
party1<='0';
wait for 10ns;
select_party<='1';
wait for 10ns;
select_party<='0';
wait for 10ns;
party2<='1';
wait for 10ns;
party2<='0';
wait for 10ns;
select_party<='1';
wait for 10ns;
select_party<='0';
wait for 10ns;
party3<='1';
wait for 10ns;
party3<='0';
wait for 10ns;
select_party<='1';
wait for 10ns;
select_party<='0';
wait for 10ns;
wait;                                  -- wait for checking output
end process;                              -- end process
end;