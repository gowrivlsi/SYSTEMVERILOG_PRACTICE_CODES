//====================================================FIFO TOP========================================
`include "fifo_queue.sv"
`include "fifo_intf.sv"
`include "fifo_tb.sv"

module fifo_top();
    reg clk,rst;

//clk generation
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
 
//rst generation
    initial begin
        rst=0;
    #20 rst=1;
    end

 //fifo_intf Instance
    fifo_intf R1(.clk(clk),
                 .rst(rst)
                );

 //fifo_queue Instance by legacy connecting
    fifo_queue R2(
                    .d_in(R1.d_in),
                    .clk(R1.clk),
                    .rst(R1.rst),
                    .wr(R1.wr),
                    .rd(R1.rd),
                    .d_out(R1.d_out),
                    .full(R1.full),
                    .empty(R1.empty)
                 );

  //fifo_tb instance
    fifo_tb R3(.t(R1));
endmodule
