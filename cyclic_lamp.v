//behavioural modeling cyclic lamp using moore machine(source code)
//Author : shifa vahora
module cyclic_lamp(clk,light);
input clk;                            //input
output reg [0:2] light;               //output
parameter s0=00, s1=01, s2=10;         //state declararation
parameter red = 3'b100, green = 3'b010, yellow = 3'b001;   //parameter set
reg [0:1] state;          //state is define as reg variable
always@(posedge clk)      //procedural block start
case(state)                
s0:                          //if state = s0 than light grow to green and next state will be s1
begin
light <= green;
state <= s1;
end
s1:                           //if state = s1 than at positive edge of clock  light grow to yellow and next state will be s2
begin
light <= yellow;
state <= s2;
end
s2:                            //if state = s2 than at positive edge of clock  light grow to red and next state will be s0
begin
light <= red;
state <= s0;
end
default:                     //if state = s1 than at positive edge of clock  light grow to yellow and next state will be s0
begin
light<= red;
state<= s0;
end                        //end procedural block
endcase                    //end case statement
endmodule                  //end module
