//behavioural modeling of priority encoder(test bench)
//Author : shifa vahora
module prioritytest;
reg in;                   //input
wire code;                 //output
priority_encoder PR (in,code);  //module instantiations
initial                //procedural block start
begin
$monitor($time,"in=%h,code=%b",in,code);     //monitoring input and output
#5 in = 16'h10;         //inputs given for testing
#5 in=16'h02;
#5 in=16'h03;
#5 in=16'h07;
#5 in=16'h09;
end
endmodule
