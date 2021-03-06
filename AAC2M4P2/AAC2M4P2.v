module RAM128x32

#(

parameter Data_width = 32, //# of bits in word

Addr_width = 7 // # of address bits

)

( //ports

input wire clk,

input wire we,

input wire [(Addr_width-1):0] address,

input wire [(Data_width-1):0] d,

output wire [(Data_width-1):0] q

);
reg [(Data_width-1):0] mem [(Data_width-1):0];


reg [Data_width-1:0]data_reg;
assign d = we ?8'bz: data_reg;

always @(posedge clk)

begin

if(we==1)
mem[address]<=d;
end
always @(posedge clk)

begin

if(we==0)
data_reg <=mem[address];
end 
endmodule
