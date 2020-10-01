module seria_tb;
reg a,b,clk,reset;
wire s;
serial_adder SER (a,b,clk, reset,s);
initial
begin
clk=1'b0;
reset=1'b1;
#15 reset=1'b0;
end
always #5 clk=~clk;
initial
begin
#12 a=4'b0000; b=4'b0001;
#10 a=4'b0101; b=4'b1010;
#10 a=4'b1000; b=4'b0010;
//#10 x=1;
//#10 x=0;
//#10 x=1;
//#10 x=0;
//#10 x=0;
#10 $finish;
end
//initial
//begin
//$monitor ($time,"State: %b", st.ps);
//end
endmodule
