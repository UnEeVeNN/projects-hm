module arithmetic_right_shift_of_N_by_S_using_concatenation #(
  parameter N = 8,
  parameter S = 3
) (
  input  logic [N - 1:0] a,
  output logic [N - 1:0] res
);

  assign res = {{S{a[N-1]}}, a[N-1:S]}

endmodule

module arithmetic_right_shift_of_N_by_S_using_for_inside_always #(
  parameter N = 8,
  parameter S = 3
) (
  input  logic [N - 1:0] a,
  output logic [N - 1:0] res
);

 always_comb begin 
    for (int i=0 ; i<N , i=i+1) begin 
        if (i+S<N) begin 
            res[i]=a[i+S];
        end
        else begin 
            res[i]=a[N-1];
        end
    end
 end


endmodule

module arithmetic_right_shift_of_N_by_S_using_for_inside_generate #(
  parameter N = 8,
  parameter S = 3
) (
  input  logic [N - 1:0] a,
  output logic [N - 1:0] res
);

  genvar i;
  generate
    for (i=0 ; i<N; i=i+1) begin: GEN_SHIFT
        if (i+)
    assign res[i]

  endgenerate 

endmodule