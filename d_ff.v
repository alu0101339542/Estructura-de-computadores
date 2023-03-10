module d_ff(d, clk, q, q_bar);
	input d, clk;
	output q, q_bar;
	reg q;
	reg q_bar;
	always @ (posedge clk)
	begin
		q <= d;
		q_bar <= !d;
	end
endmodule
