// Testbench para modulo alu
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulaci�n y la precision de la unidad
module alu_tb;
//declaracion de se�ales
reg [1:0] t_Op;
reg t_L;
reg [3:0] t_A, t_B;
wire [3:0] t_R;
wire t_z, t_c, t_s;
integer errores;
//instancia del modulo a testear
alu mat(t_R, t_z, t_c, t_s, t_A, t_B, t_Op, t_L);

initial
begin
  $dumpfile("alu.vcd");
  $dumpvars;
 $monitor("tiempo=%0d A=%b B=%b L=%b Op=%b R=%b, Z=%b, C=%b, S=%b", $time, t_A, t_B, t_L, t_Op, t_R, t_z, t_c, t_s);

  t_L = 0; t_Op[1] = 1; t_Op[0] = 0;
  t_A = 4'b0111; t_B = 4'b1011;
  #20; 
  //fin simulacion
  $finish;
end

// Tarea para hacer la comprobaci�n autom�tica de resultados
endmodule
