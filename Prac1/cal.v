`include "cl.v"
`include "fa.v"
`include "mux2_1.v"
module cal(output wire out, c_out, input wire a, b, l, c_in, input wire [1:0] s);
  wire sal_cl, sal_fa;
  cl celdalog(sal_cl, a, b, s);
  fa fulladder(c_out, sal_fa, a, b, c_in);
  mux2_1 multiplexor2a1(out, sal_fa, sal_cl, l);
endmodule