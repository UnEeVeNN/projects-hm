module serial_adder_using_logic_operations_only (
  input  logic clk,
  input  logic rst,
  input  logic a,
  input  logic b,
  output logic sum
);
logic carry;
wire carry_d;
assign sum = a^b^carry;
assign carry_d = (a&b) | ((a^b)& carry);
always_ff @ (posedge clk)
if (rst) begin
    carry <= '0;
end
else begin 
    carry <= carry_d;
end
    

endmodule