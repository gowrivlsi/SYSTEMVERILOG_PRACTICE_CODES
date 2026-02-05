module deco_dut(
                    input [1:0] y,
                    output reg [3:0]i
                );

    always_comb
        begin
            case(y) 
                2'b00 : i = 4'b0001;
                2'b01 : i = 4'b0010;
                2'b10 : i = 4'b0100;
                2'b11 : i = 4'b1000;
            endcase
        end
endmodule
