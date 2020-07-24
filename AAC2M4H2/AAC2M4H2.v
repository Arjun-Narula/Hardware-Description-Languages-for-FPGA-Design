

module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input rden, wren);
//signal declarations

	reg [8:0] fifo_array[7:0];
	reg [7:0] wrptr, rdptr;
	wire [7:0] wr_cnt, rd_cnt;



always @( posedge clk ) 
begin: write
 if(wren && rden) 
fifo_array[wrptr] <= DataIn;
wrptr<=wrptr+WrInc;

end

always @( posedge clk ) 
begin: read
if(rden && wren ) 
  DataOut <= fifo_array[rdptr];
rdptr<=rdptr+RdInc;
end

always @( posedge clk ) 
begin: pointer
  if( rst ) 
  begin 
    wrptr <= 0; 
    rdptr <= 0;
  end 
  else 
  begin
if(RdPtrClr)
    rdptr<=00000000;
if(WrPtrClr)
wrptr<=00000000;
  end 

end


endmodule 