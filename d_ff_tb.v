module d_ff_tb;
	reg clock, reset, d;
	wire q, q_bar;
	initial begin
		$dumpfile ("d_ff_tb.vcd");
		$dumpvars (1, d_ff_tb);
		$monitor ("clock=%b, d=%b, q=%b, q_bar=%b", clock, d, q, q_bar);
		clock = 0;
		d = 1;
		#10 d = 0;
		#20 $finish;
	end
	always begin
		#5 clock = !clock;
	end
	d_ff d0(.d (d), .clk (clock), .q (q), .q_bar (q_bar));
endmodule
