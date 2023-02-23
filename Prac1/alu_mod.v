`include "mux2_4.v"
`include "compl1.v"
`include "cal.v"
module alu(output wire [3:0] r, output wire zero, carry, sign, input wire [3:0] a, b, input wire [1:0] aluop, input wire l);
  
  wire [3:0] op1, sal_muxb, op2; //Cables de 4 bITS
  wire op1_a, op2_b, cp1, cin0, cin1, cin2, cin3; // cables de 1 bIT
  
  //asignamos a las variables el valor(objetivo 5)
  assign op1_a = ~aluop[1] | l;
 // assign op1_a = ~aluop[1] | l;
  assign op2_b= 1;
  assign cp1 = ~l & aluop[0];
  assign cin0 = aluop[0] | aluop[1];

  mux2_4 multipl_a(op1, 4'b0000, a, op1_a);
  mux2_4 multipl_b(sal_muxb, a, b, op2_b);
  compl1 complemento(op2, sal_muxb, cp1);

  //Declaramos el comportamiento de todas la cals
  cal celal0(r[0], cin1, op1[0], op2[0], l, cin0, aluop);
  cal celal1(r[1], cin2, op1[1], op2[1], l, cin1, aluop);
  cal celal2(r[2], cin3, op1[2], op2[2], l, cin2, aluop);
  cal celal3(r[3], carry, op1[3], op2[3], l,cin3, aluop);

  assign sign = r[3];
  assign zero = ~|r;
endmodule