module not_gate_with_mux
(
  input  i,
  output o
);

mux mux_not(.d0(1'b1), .d1(1'b0), .sel(i), .y(o));

endmodule