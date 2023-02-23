// Testbench para modulo semisumador visto antes
`timescale 1 ns / 10 ps
//Directiva que fija la unidad de tiempo de simulación y el paso de simulación
module mux4_1_tb;
//declaracion de señales
reg test_a, test_b, test_c, test_d;
reg [1:0] s; // las señales de entrada al multiplexor. Se han declarado reg
// porque queremos inicializarlas
wire test_out; //señales de salida, se declaran como wire porque sus
// valores se fijan por el multiplexor
//instancia del modulo a testear, con notación de posiciones de argumentos
mux4_1 multiplexor(test_out, test_a, test_b, test_c, test_d, s);
//Lo siguiente comentado es una notación alternativa para instanciar el módulo, los
//parámetros se denotan con un punto seguido del nombre del parámetro en la definición
//original del módulo y entre paréntesis a qué se conecta en el modulo actual
//no importa el orden de los parámetros definidos así -
//ha_v1 ha1(.a(test_a), .b(test_b), .sum(sum), .carry(test_carry));
initial
begin
// sentencia para mostrar los valores de tiempo y variables, en cuanto cualquiera de
// éstas cambie
$monitor("tiempo=%0d a=%b b=%b c=%b d=%b s=%b out=%b", $time, test_a, test_b, test_c, test_d, s, test_out);
//vector de test 0
s = 2'b00;
test_a = 1'b1;
test_b = 1'b0;
test_c = 1'b0;
test_d = 1'b0;
#20;
//vector de test 1
s = 2'b01;
test_a = 1'b0;
test_b = 1'b1;
test_c = 1'b0;
test_d = 1'b0;
#20;
//vector 2
s = 2'b10;
test_a = 1'b0;
test_b = 1'b0;
test_c = 1'b0;
test_d = 1'b0;
#20;
//vector 3
s = 2'b11;
test_a = 1'b0;
test_b = 1'b1;
test_c = 1'b0;
test_d = 1'b1;
#20;
$finish;
//fin simulacion
end
endmodule