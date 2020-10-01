module serial_adder(a,b,clk, reset,s);
input a,b,reset, clk;
output reg s;
parameter s0=0,s1=1;
reg PS,NS;
always@(posedge clk or posedge reset)
if (reset)
PS<= s0;
else
PS<= NS;
always@(PS,s)
case(PS)
s0:
if (a==0&b==0)
begin
NS = s0;
s=0;
end
else if (a==0 & b==1)
begin
NS = s0;
s=1;
end
else if (a==1 & b==0)
begin
NS = s0;
s=1;
end
else if(a==1 & b==1)
begin
NS = s1;
s=0;
end
s1:
if (a==0 & b==0)
begin
NS = s0;
s=1;
end
else if (a==0 & b==1)
begin
NS = s1;
s=0;
end
else if (a==1 & b==0)
begin
NS = s1;
s=0;
end
else if (a==1 & b==1)
begin
NS = s1;
s=1;
end
endcase
endmodule
