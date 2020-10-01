module se_dettb;
reg clk, x,reset;
wire z;
seq_det SEQ (x,clk,reset,z);
initial
begin
clk = 1'b0;
reset = 1'b1;
#15 reset = 1'b0;
end
always 
#5 clk = ~clk;
initial 
begin
 #12 x = 0;
 #10 x = 1;
 #10 x = 1;
 #10 x = 0;
 #10 x = 1;
 #10 x = 1;
 #10 x = 1;
 #10 x = 0;
 #10 x = 1;
 #10 $finish;
end
endmodule
