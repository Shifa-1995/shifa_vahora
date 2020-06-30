//modeling of 16 bit adder with generation generation of status flag(source code)
//Author : shifa vahora
module adder4(s,cout,a,b,cin);   //behavioural modeling 4 bit adder
input[3:0] a,b;                  //inputs
input cin;
output [3:0] s;                  //outputs
output cout;
assign {cout,s} = a+b+cin;        //assign statement for generation of sum and carry
endmodule
module ALU(x, y, z, sign, zero, carry, parity, overflow);      //structural modeling of ALU 
input[15:0] x,y;                   //inputs
output[15:0] z;                    //output
output sign, zero, carry, parity, overflow;      //output
wire [3:0] c;                      //interconnection of hardware
assign sign = z[15];                //generating sign flag
assign zero = ~|z;                  //generating zero flag
assign parity = ~^z;                 //generating parity flag
assign overflow = (x[15] & y[15] & ~z[15])|(~x[15] & ~y[15] & z[15]);     //generating overflow flag
adder4 A0 (z[3:0], c[1], x[3:0], y[3:0], 1'b0);
adder4 A1 (z[7:4], c[2], x[7:4], y[7:4], c[1]);                //instantiating 4 4_bit adder
adder4 A2 (z[11:8], c[3], x[11:8], y[11:8], c[2]);
adder4 A3 (z[15:12], carry, x[15:12], y[15:12], c[3]);
endmodule
