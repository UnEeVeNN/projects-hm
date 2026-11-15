module mux_4_1
(
  input        [3:0] d0, d1, d2, d3,
  input        [1:0] sel,
  output logic [3:0] y
);
logic[3:0] d[0:3];
assign d[0]=d0;
assign d[1]=d1;
assign d[2]=d2;
assign d[3]=d3;
assign y=d[sel];
endmodule