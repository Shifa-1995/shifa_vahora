//structural modeling of 4-bit adder(testbench)
//author : shifa vahora
module addertest;
reg [3:0]a,b;
reg c1;
wire [3:0] s;
wire c;
fullader ADD(s,c,a,b,c1);
initial 
begin
$monitor($time,"s=%b,c=%b, a=%b, b=%b, c1=%b",s,c,a,b,c1);
#5 a=4'b0000; 
   b=4'b0001; 
   c1=1'b1;
#5 a=4'b1000; 
   b=4'b0001;
   c1=1'b0; 
#5 a=4'b0110; 
   b=4'b1001; 
   c1=1'b1;
#5 a=4'b1111; 
   b=4'b0001;
   c1=1'b0; 
#5 $finish;
end
endmodule
