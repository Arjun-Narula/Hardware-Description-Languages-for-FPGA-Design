module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);
parameter state0=0, state1=1, state2=2;
reg [1:0] state, nxt_state;

always@(posedge CLK , negedge RST)
if (RST==0) state <= state0;
else state <=nxt_state;

always@(state,In1)
case(state)
state0 : if (In1) nxt_state<=state1 ;else  nxt_state<=state0;
state1 : if (In1) nxt_state<=state1 ;else  nxt_state<=state2;
state2 : if (In1) nxt_state<=state0 ;else  nxt_state<=state2;
endcase

always@(state,In1)
case(state)
state0 : Out1 = 0;
state1 : Out1 = 0;
state2 : Out1 = 1;
endcase
endmodule
