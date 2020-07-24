module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y);

always@(*)
begin
case(Op_code)
3'b000 : Y = A;
3'b001 : Y = A+B;
3'b010 : Y = A-B;
3'b011 : Y = (A & B);
3'b100 : Y = (A |B);
3'b101 : Y = A+1;
3'b110 : Y = A-1;
3'b111 : Y = B;
default: Y = 0000_0000_0000_0000_0000_0000_0000_0000;
endcase
end

endmodule
