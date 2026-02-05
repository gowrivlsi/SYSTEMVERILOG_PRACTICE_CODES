`include"fifo_dut.sv"
`include"fifo_intf.sv"
`include"fifo_tb.sv"
`include"fifo_assert.sv"

module fifo_top;
    reg clk,rst;

    initial begin
        clk = 0;
        forever #5 clk =~clk;
    end

    initial begin
        rst = 0;
   #20   rst = 1;
    end
    
    fifo_intf I(.clk(clk),
                .rst(rst)
                );

    fifo_dut D(
                .clk(I.clk),
                .rst(I.rst),
                .wr(I.wr),
                .rd(I.rd),
                .d_in(I.d_in),
                .d_out(I.d_out),
                .full(I.full),
                .empty(I.empty)
                );

    fifo_tb T(I);

    bind D fifo_assert A(.clk(clk),
                         .rst(rst),
                         .wr(wr),
                         .rd(rd),
                         .d_in(d_in),
                         .full(full),
                         .empty(empty),
                         .d_out(d_out)
                        );

    initial #250 $stop;
endmodule
