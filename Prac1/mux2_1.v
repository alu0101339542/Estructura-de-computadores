module mux2_1(output wire out, input wire a, input wire b, input wire s);
  assign out = s ? b :a;
endmodule