//modeling of priority encoder
// Author : shifa vahora
module priority_encoder(in,code);
input[7:0] in;        //input
output reg[2:0] code;     //output
always @ in                //always statement start
begin
if (in[0])                  //if input =0 than outpts =000
code = 3'b000;
else if (in[1])
code = 3'b001;
else if (in[2])
code = 3'b010;
else if (in[3])
code = 3'b011;
else if (in[4])
code = 3'b100;
else if (in[5])
code = 3'b101;
else if (in[6])
code = 3'b110;
else if (in[7])
code = 3'b111;
else 
code = 3'bxxx;
end                           //always statement end
endmodule
