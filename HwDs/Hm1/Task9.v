module or_gate_with_mux
(
  input  a, b,
  output o
);

  // Ваш код здесь
    mux mux_and(.d0(b), .d1(1'b1), .sel(a), .y(o));
endmodule