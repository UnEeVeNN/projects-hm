
module parallel_to_serial #(
    parameter int width = 8
) (
    input  logic             clk,
    input  logic             rst,
    input  logic             parallel_valid,
    input  logic [width-1:0] parallel_data,
    output logic             busy,
    output logic             serial_valid,
    output logic             serial_data
);

    // Ширина счетчика: он должен уметь хранить значения от 0 до width
    localparam int COUNT_W =
        (width > 1) ? $clog2(width + 1) : 1;

    // Регистр хранения исходного числа
    logic [width-1:0] shift_reg;

    // Счетчик отправленных битов
    logic [COUNT_W-1:0] count;

    always_ff @(posedge clk) begin

        if (rst) begin
            shift_reg   <= '0;
            count       <= '0;
            busy        <= 1'b0;
            serial_valid <= 1'b0;
            serial_data <= 1'b0;
        end

        else begin

            // По умолчанию бит не считается действительным
            serial_valid <= 1'b0;

            // Если передача не выполняется
            if (!busy) begin

                // Загружаем новое число
                if (parallel_valid) begin
                    shift_reg <= parallel_data;
                    count <= '0;
                    busy <= 1'b1;
                end

            end

            // Если передача выполняется
            else begin

                // Проверяем, отправили ли уже все биты
                if (count == width) begin
                    busy <= 1'b0;
                    count <= '0;
                end

                else begin

                    // Выдаем младший бит
                    serial_data <= shift_reg[0];

                    // Сообщаем, что бит действительный
                    serial_valid <= 1'b1;

                    // Сдвигаем регистр вправо
                    shift_reg <= shift_reg >> 1;

                    // Увеличиваем количество отправленных битов
                    count <= count + 1'b1;

                end
            end
        end
    end

endmodule
