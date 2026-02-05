`include"dram_dut.sv"
`include"dram_intf.sv"
`include"dram_tb.sv"

module top;
    
    reg clk,rst;

        initial begin
            clk=0;
            forever #5 clk =~clk;
        end

        initial begin
            rst = 0;
        #20 rst = 1;
        end


        dram_intf I(.clk(clk),
                    .rst(rst)
                    );

        dram_dut D(
                    .clk(I.clk),
                    .rst(I.rst),
                    .wren(I.wren),
                    .refresh(I.refresh),
                    .addr(I.addr),
                    .d_in(I.d_in),
                    .d_out(I.d_out)
                    );

        dram_tb T(I.tb);
endmodule
