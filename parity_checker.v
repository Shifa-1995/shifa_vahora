//behavioural modeling of parity checker using moore machine(source code)
//Author : shifa vahora
module parity_checker(x, clk, z);
input x, clk;          //inputs
output reg z;          //outputs
reg even_odd;           // It is reg type because it is use in always block
parameter even =0, odd =1;     //
always@(posedge clk)
case(even_odd)
 even : even_odd <= x ? odd :even;
 odd : even_odd <= x ? even : odd;
 default : even_odd <= even;
endcase
always@(posedge clk)
case(even_odd)
 even : z = 0;
 odd : z = 1;
endcase
endmodule
