module round_robin_arbiter_with_2_requests (
  input        clk,
  input        rst,
  input  logic [1:0] requests,
  output logic [1:0] grants
);
 logic prior;
 always_comb begin 
    grants = 2'b00;
    case (requests)
        2'b00: grants = 2'b00; 
        2'b01: grants = 2'b01; 
        2'b10: grants = 2'b10;

        2'b11: begin
        if (prior==1'b0)
            grants = 2'b01;
        else
            grants = 2'b10;
        end 
    default: grants = 2'b00;
    endcase
end
  always_ff @(posedge clk) begin
        if (rst)
            prior <= 1'b0;
        else if (grants[0])
            prior <= 1'b1;
        else if (grants[1])
            prior <= 1'b0;
    end
endmodule