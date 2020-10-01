//Behavioural modeling of multiplication by addition using datapath and control unit(source code) 
//Author : shifa vahora
module MUL_datapath(eqz, LdA, LdB,LdP, clrp, decB, data_in, clk);    //bahavioural modeling og datapath unit
input LdA, LdB,LdP, clrp, decB, clk;           //input for datapath unit
input [15:0] data_in;
output eqz;                                    //output for datapath unit
wire x, y, z,Bout, BUS;                        //interconnection 
PIP01 A (x, BUS, LdA, clk);              // A module for load operation of A             
PIP02 P (y, z, LdP, clrp,clk);           // p module for load and clear operation of p  
CNTR B (Bout, BUS, LdB, decB, clk);       // B module for lad and decrement operation of b
ADDER AD(z,x,y);                          // Add module for addition operatio
EQZ COMP(eqz,Bout);                       //equal module
endmodule
module PIP01 (dout,din,ld,clk);           //behavioural modeling of module A   
input [15:0] din;                         //input for A
input ld,clk;
output reg[15:0] dout;                    //output
always @(posedge clk)                     //operation takes place at every positive edge of clk
if (ld)                                   //if ld signal active than din goes to dout
dout <=din;
endmodule
module ADDER (out, in1,in2);              //behavioural modeling of adder
input [15:0] in1,in2;                     //input
output reg [15:0] out;                    //output
always @(*)                               //if any variable chnage addition operation will take place
assign out = in1+in2;
endmodule
module PIP02(dout,din,ld,clr,clk);
input [15:0] din;
input ld,clr,clk;
output reg [15:0] dout;
always@(posedge clk)
if (clr)
dout <= 16'b0;
else if (ld)
dout <= din;
endmodule
module EQZ (eqz,data);
input [15:0] data;
output eqz;
assign eqz = (data ==0);
endmodule
module CNTR(dout,din,ld,dec,clk);
input [15:0] din;
input ld,dec,clk;
output reg [15:0] dout;
always@(posedge clk)
if(ld)
dout <=din;
else if(dec)
dout<=dout-1;
endmodule
module controller(LdA,LdB,LdP,clrp,decB,done,clk,eqz,start);
input clk, eqz,start;
output reg LdA,LdB,LdP,clrp,decB,done;
reg [2:0] state;
parameter s0=3'b000, s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
always@(posedge clk)
begin
case(state)
s0: 
if (start)
state <=s1;
s1:
state <=s2;
s2:
state <=s3;
s3:
#2 if(eqz)
state <=s4;
s4:
state <=s4;
default : state<=s0;
endcase
end
always@(state)
begin
case(state)
s0:
begin
#1 LdA = 0;
   LdB = 0;
   LdP = 0;
   clrp = 0;
   decB = 0;
end
s1:
begin
#1 LdA = 1;
end
s2:
begin
#1 LdA = 0;
   LdB = 1;
   clrp = 1;
end
s3:
begin
#1 LdB = 0;
   LdP = 1;
   clrp = 0;
   decB = 0;
end
s4:
begin
#1 done = 1;
   LdB = 0;
   LdP = 0;
   decB = 0;
end
default:
begin
#1 LdA = 0;
   LdB = 0;
   LdP = 0;
   clrp = 0;
   decB = 0;
end
endcase
end
endmodule
