module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output [3:0]Q,        // Parallel Output 	
    output RCO            // Ripple Carry Output (Terminal Count)
); 
reg [3:0]temp;
always@(posedge CLK or  posedge CLR_n)
begin
if(CLK==1 & CLR_n==0) 

temp <= 4'b0000;

else if(CLK==1) 

if(LOAD_n==0)

temp = D;

else if (LOAD_n==0 & ENT==1 & ENP==1)

temp = temp+4'b0001;
end

 assign D = temp;
assign  RCO = temp[0] & temp[1] & temp[2] & temp[3] & ENT;

endmodule
