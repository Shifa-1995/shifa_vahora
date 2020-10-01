module seq_det(x,clk,reset,z);
input x, clk, reset;
output reg z;
parameter s0=0, s1=1, s2=2, s3=3;
reg[0:1] PS, NS;
always@(posedge clk or posedge reset)
if (reset) 
PS<=s0;
else 
PS<=NS;
always@(PS, x)
case(PS)
s0:
begin
 z = x ? 0 : 0;
 NS = x  ? s0 : s1;
end
s1:
begin
 z = x ? 0 : 0;
 NS = x ? s2 :s1;
end
s2:
begin
 z = x ? 0 : 0;
 NS = x ? s3 :s1;
end
s3:
begin
 z = x ? 0 : 1;
 NS = x ? s0 :s1;
end
endcase
endmodule
