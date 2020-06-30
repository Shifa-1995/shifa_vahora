//structural modeling of 4 bit adder using adder
//author : shifa vahora
module bit_adder (s,cout,a,b,cin);    //structural modeling of 4-bit adder
input [3:0] a,b;            //inputs
input cin;                  //inputs
output cout;                //output carry
output [3:0] s;             //output sum
wire c1,c2,c3;
fulladder FA1(s[0], c1, a[0], b[0], cin);       //instatiating 4 fulladder     
fulladder FA2(s[1], c2, a[1], b[1], c1);
fulladder FA3(s[2], c3, a[2], b[2], c2);
fulladder FA4(s[3], cout, a[3], b[3], c3);
endmodule
module fullader (s,cout,a,b,c);     //behavioural modeling of fulladder
input a,b,c;              //inputs of fulladder
output s,cout;            //outputs of fulladder
wire s1,c1,c2;             //interconnection
xor GT1 (s1,a,b), GT2(s,s1,c), GT3(cout,c1,c2);
and GT4 (c1,a,b), GT5(c2,s1,c);
endmodule
