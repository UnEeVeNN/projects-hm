module serial_adder_using_logic_operations_only (
  input  logic clk,
  input  logic rst,
  input  logic a,
  input  logic b,
  input  logic last,
  output logic sum
);
logic carry;
wire carry_d;
assign sum = a^b^carry;
assign carry_d = (a&b) | ((a^b)& carry);
always_ff @ (posedge clk) begin
if (rst) 
    carry <= 1'b0;
else if (vld) begin
    if (last)  
        carry <= 1'b0;
    else
    carry <= carry_d;
    end
end
    

endmodule