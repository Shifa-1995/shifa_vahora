//behavioural modeling of D flipflop
//author : shifa vahora
module d_flipflop(D,Q,En);
input D,En;            //input        
output Q;              //output
assign Q = En ? D : Q;    //conditional statement
endmodule 
