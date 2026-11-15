module mux_4_1
(
  input        [3:0] d0, d1, d2, d3,
  input        [1:0] sel,
  output       [3:0] y
);
wire sel0= ~sel[0] & ~sel[1];
wire sel1= sel[0] & ~sel[1];
wire sel2= ~sel[0] & sel[1];
wire sel3= sel[0] & sel[1];

assign y= (d0 & {4{sel0}})|(d1 & {4{sel1}})|(d2 & {4{sel2}})|(d3 & {4{sel3}});
endmodule