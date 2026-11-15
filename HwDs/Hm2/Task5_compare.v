module serial_comparator_most_significant_first (
  input  logic clk,
  input  logic rst,
  input  logic a,
  input  logic b,
  output logic a_less_b,
  output logic a_eq_b,
  output logic a_greater_b
);

logic prev_a_eq_b, prev_a_less_b;
assign a_eq_b = prev_a_eq_b & (a == b);
assign a_less_b = prev_a_less_b | (prev_a_eq_b & ~a & b);
assign a_greater_b = (~ a_eq_b) & (~ a_less_b);
  always_ff @ (posedge clk)
    if (rst)
    begin
      prev_a_eq_b   <= '1;
      prev_a_less_b <= '0;
    end
    else
    begin
      prev_a_eq_b   <= a_eq_b;
      prev_a_less_b <= a_less_b;
    end


endmodule