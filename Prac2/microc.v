`include "memprog.v"
`include "alu.v"
`include "componentes.v"
module microc(input wire clk, reset, s_abs, s_inc, s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);
//Microcontrolador sin memoria de datos de un solo ciclo

//Instanciar e interconectar pc, memprog, regfile, alu, sum, biestable Z y mux's
wire [9:0]sal_pc, sal_mux_sum, sal_sum, sal_mux_s;
wire [7:0]wd3, sal_rd1, sal_rd2, sal_alu;
wire [15:0]sal_mp;
wire zalu;
memprog memoriap(clk, sal_pc, sal_mp); 
mux2 #(10)mux_sum(sal_mp[9:0], 10'b0000000001, s_inc, sal_mux_sum); // si inc=0 propaga los 10 bits si inc=1 ->1
sum sumador(sal_pc, sal_mux_sum, sal_sum);
mux2 #(10)mux_pc(sal_sum, sal_mp[9:0], s_abs, sal_mux_s);// si s=0 salida sumador si s=1 10 b sal_pc
registro #(10)pgc(clk, reset, sal_mux_s, sal_pc);
regfile b_registro(clk, we3, sal_mp[11:08], sal_mp[7:4], sal_mp[3:0], wd3, sal_rd1, sal_rd2 );
alu alum(sal_rd1, sal_rd2, op, sal_alu, zalu);
mux2 #(8)mux1(sal_mp[11:04], sal_alu, s_inm, wd3); // si s=0 sal_mp si s=1 sal_alu 
ffd ffz(clk, reset, zalu, wez, z);
assign opcode = sal_mp[15:10];
//microc microc(clk, reset, s_abs, s_inc, s_inm, we3, wez, op, z, [15:10]sal_mp,);

endmodule



