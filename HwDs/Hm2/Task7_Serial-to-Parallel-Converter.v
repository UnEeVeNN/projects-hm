module serial_to_parallel
# (
    parameter width = 8
)
(
    input                      clk,
    input                      rst,
    input                      serial_valid,
    input                      serial_data,
    output logic               parallel_valid,
    output logic [width - 1:0] parallel_data
);

localparam int COUNT = (width > 1) ? $clog2(width) : 1;
logic [width-1 : 0] shift_reg; 
logic [COUNT-1 : 0] count;
logic [width-1 : 0] next_word;
always_comb begin
    next_word = shift_reg >> 1;
    next_word[width-1] = serial_data;
end //сдвиг 

always_ff @(posedge clk) begin
    if (rst) begin 
        shift_reg <= 1'b0;
        count <= 1'b0;
        parallel_data <= 1'b0;
        parallel_valid <= 1'b0;
    end

    else begin 
        parallel_valid <= 1'b0;
        if (serial_valid) begin 
            shift_reg <= next_word;
             if (count == width -1) begin 
                parallel_data <= next_word;
                parallel_valid <= 1'b1;
                count <= 1'b0;
             end
            else begin 
                count <= count + 1'b1;
            end
        end
    end
end
endmodule


