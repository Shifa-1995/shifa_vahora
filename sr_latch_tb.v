//Hardware modeling of SR latch (tsstbench code)
// Author : shifa vahora
module srtest;
reg s,r;           //inputs
wire q,qbar;        //outputs
sr_latch SQ (s,r,q,qbar);      //instantiating sr_latch souce code
initial               //procedural block start
begin
$monitor($time,"s=%b, r=%b, q=%b, qbar=%b",s,r,q,qbar);    //monitoring outputs of SR_latch
#2 s=1'b0;      //inputs  given for testing
   r=1'b1;
#2 s=1'b1; 
   r=1'b1;
#2 s=1'b0; 
   r=1'b0;
#2 s=1'b1; 
   r=1'b0;
#5 $finish;
end
endmodule
