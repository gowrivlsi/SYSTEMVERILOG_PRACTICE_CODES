module dff_dut(
                input clk,rst,[7:0]din,
                output reg [7:0]q
                );

    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                q = 1'b0;
            else
                q = din;
        end
endmodule
