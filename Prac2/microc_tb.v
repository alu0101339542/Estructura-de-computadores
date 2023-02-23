`timescale 1 ns/10 ps
module microc_tb;
//declaracion de se�ales
reg test_clk, test_reset, test_sabs, t_s_inc, test_s_inm, test_we3, test_wez;
wire test_z;
reg [2:0] test_op;
wire [5:0] test_opcode;
//instancia del modulo a testear
microc mic(test_clk, test_reset, test_sabs, t_s_inc, test_s_inm, test_we3, test_wez, test_op, test_z, test_opcode);

always 
begin

	test_clk = 1;
	#10;
	test_clk = 0;
	#10;
end

initial
begin

	test_reset = 1;
	#5;
	test_reset = 0;
end

initial 
begin
//LI
	#10;
  test_sabs = 0;
	t_s_inc = 1;
	test_s_inm = 1;
  test_we3 = 1;
  test_wez = 1;
	test_op = 3'b000;
  //LI
	#20;
	test_sabs = 0;
	t_s_inc = 1;
	test_s_inm = 1;
  test_we3 = 1;
  test_wez = 1;
	test_op = 3'b000;
	#20;
  //LI
	test_sabs = 0;
	t_s_inc = 1;
	test_s_inm = 1;
  test_we3 = 1;
  test_wez = 1;
	test_op = 3'b000;
	#20;
  //JR
  test_sabs = 0;
	t_s_inc = 0;
	test_s_inm = 0;
  test_we3 = 1;
  test_wez = 1;
	test_op = 3'b000;
	#20;
  //suma
	test_sabs = 0;
	t_s_inc = 0;
	test_s_inm = 1;
  test_we3 = 0;
  test_wez = 1;
	test_op = 3'b010;
	#20;
  //resta
	test_sabs = 0;
	t_s_inc = 0;
	test_s_inm = 1;
  test_we3 = 0;
  test_wez = 1;
	test_op = 3'b011;
	#20;
  //JNZ
	test_sabs = 0;
	t_s_inc = 1;
	test_s_inm = 0;
  test_we3 = 1;
  test_wez = 1;
	test_op = 3'b000;
	#20;
  //J
	test_sabs = 0;
	t_s_inc = 0;
	test_s_inm = 0;
  test_we3 = 1;
  test_wez = 1;
	test_op = 3'b000;
	#20;
end

initial 
begin

	$monitor(test_clk, test_reset, test_sabs, t_s_inc, test_s_inm, test_we3, test_wez, test_op, test_z, test_opcode);
	$dumpfile("micro_tb.vcd");
	$dumpvars;
	#200;
	$finish;
end
endmodule