//multiplication by repeated addition using datapath and control unit(testbench)
//Author : shifa vahora
module MUL_test;
reg [15:0] data_in;           //inputs
reg clk,start;                 //inputs
wire done;                      //outputs
MUL_datapath DP(eqz,LdA, LdB, LdP,clrp,decB,data_in,clk);     //instantiating datapath unit 
controller CON(LdA,LdB,LdP,clrp,decB,done,clk,eqz,start);     //instantiating control unit
initial              //procedural block start
begin
clk =1'b0;              //generating clock signal
#3 start = 1'b1;
#500 $finish;
end
always #5 clk = ~clk;
initial
begin
#17 data_in = 17;             //data input given for testing
#10 data_in = 10;
end
initial
begin
$monitor ($time, " %d %b ", DP.y, done);       //monitoring output at port y
#500 $finish;                 //finishing operation
end
endmodule
