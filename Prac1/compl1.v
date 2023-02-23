module compl1(output wire [3:0] sal, input wire [3:0] ent, input wire cpl);

  assign sal = cpl ? ~ent : ent;
endmodule