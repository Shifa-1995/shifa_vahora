//modeling of S R latch
//author : shifa vahora
module sr_latch(s,r,q,qbar);
input s,r;                //input
output q,qbar;              //output
assign q = ~(r & qbar);     
assign qbar = ~(s & q);
endmodule

