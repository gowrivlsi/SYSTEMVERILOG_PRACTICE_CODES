`include"fifo_dut.sv"
`include"fifo_intf.sv"
`include"fifo_tb.sv"

module top;
    
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

  
  fifo_dut D(.clk(I.clk),
              .rst(I.rst),
              .d_in(I.d_in),
              .wr(I.wr),
              .rd(I.rd),
              .d_out(I.d_out),
              .full(I.full),
              .empty(I.empty)
              );

   
    fifo_tb T(I);
       initial begin
        #100 $stop;
       end

       
endmodule
