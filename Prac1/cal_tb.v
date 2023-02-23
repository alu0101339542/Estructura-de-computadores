// Testbench para modulo semisumador visto antes
`timescale 1 ns / 10 ps
//Directiva que fija la unidad de tiempo de simulación y el paso de simulación
module cal_tb;
//declaracion de señales
reg test_a, test_b, test_l, test_cin;
reg [1:0] s; // las señales de entrada al multiplexor. Se han declarado reg
// porque queremos inicializarlas
wire test_out; //señales de salida, se declaran como wire porque sus
cal celda(test_out, test_cout, test_a, test_b, test_l, test_cin, s); 
initial
begin
// sentencia para mostrar los valores de tiempo y variables, en cuanto cualquiera de
// éstas cambie
$monitor("tiempo=%0d a=%b b=%b l=%b cin=%b s=%b out=%b cout=%b", $time, test_a, test_b, test_l, test_cin, s, test_out, test_cout);
//vector de test 0
s = 2'b00;
test_a = 1'b0;
test_b = 1'b0;
test_l = 1'b0;
test_cin = 1'b1;
#20;
//vector de test 1
s = 2'b01;
test_a = 1'b0;
test_b = 1'b1;
test_l = 1'b1;
test_cin = 1'b0;
#20;
//vector 2
s = 2'b10;
test_a = 1'b1;
test_b = 1'b1;
test_l = 1'b1;
test_cin = 1'b0;
#20;
//vector 3
s = 2'b11;
test_a = 1'b0;
test_b = 1'b1;
test_l = 1'b1;
test_cin = 1'b1;
#20;
$finish;
//fin simulacion
end
endmodule