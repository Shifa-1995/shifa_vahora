//behavioural modeling of cyclic lamp(test bench)
//Author : shifa vahora
module test_cyclic_lamp;
reg clk;                              //input
wire[0:2] light;                      //output
cyclic_lamp LAMP(clk,light);          //module instantiations
always #5 clk = ~clk;                 //always block for clock generation
initial 
begin
 clk = 1'b0;                           //clock=0
#100 $finish;                          //It finish at 100
end 
initial
begin
$monitor ($time,"RGY : %b",light);         //monitoring input and output
end 
endmodule
