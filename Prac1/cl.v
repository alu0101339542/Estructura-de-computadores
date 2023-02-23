
`include "mux4_1.v"
module cl(output wire out, input wire a, b, input wire [1:0] s);

//definiciones de variables
wire sal_and, sal_or, sal_xor, sal_not;

and and1(sal_and, a, b);
or or1(sal_or, a, b);
xor xor1(sal_xor, a, b);
not not1(sal_not, a);

mux4_1 multiplexor(out, sal_and, sal_or, sal_xor, sal_not, s);

endmodule
