//modeling of 16_to_1 mux using 4_ to_1 mux(source code)
//Author :shifa vahora
module mux4to1 (in,sel,out);     // behavioural modeling of 4_to_1 mux  
input[3:0] in;                   //input
input[1:0] sel;                  //input
output out;                      //output
assign out = in[sel];            //conditional statement
endmodule
module mux16to1 (in,sel,out);    //structural modeling of 16_to_1 mux
input[15:0] in;                  //input
input[3:0] sel;
output out;                      //output
wire [3:0] t;                    //inteconnection
mux4to1 M0(in[3:0], sel[1:0], t[0]);       //instantiating 5 4_to_1 mux
mux4to1 M1(in[7:4], sel[1:0], t[1]);
mux4to1 M2(in[11:8], sel[1:0], t[2]);
mux4to1 M3(in[15:12], sel[1:0], t[3]);
mux4to1 M4(t, sel[3:2], out);
endmodule
