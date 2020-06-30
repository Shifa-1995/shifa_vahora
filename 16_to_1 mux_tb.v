//16_to_1 mux using 4_to_1 mux(tast_bench)
//author: shifa vahora
module mux16to1test;
reg[15:0] A;      //input
reg[3:0] s;       //input
wire F;           //output
 mux16to1 M(.in(A),.sel(s),.out(F));    //module instantiations
initial
begin                 //start procedural block
$monitor ($time,"A=%h, s=%h, F=%b",A,s,F);
#5 A=16'h3F0A; s=4'h0;        //inputs given to mux for testing purpose
#5 s=4'h1;
#5 s=4'h6;
#5 s=4'hc;
#5 $finish;         //finish 
end
endmodule
