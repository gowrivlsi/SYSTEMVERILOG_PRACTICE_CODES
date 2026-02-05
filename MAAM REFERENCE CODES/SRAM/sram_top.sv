`include "sram_intf.sv"
`include "sram_dut.sv"
`include "sram_tb.sv"


module top;
  reg clk,rst;

  initial begin
   clk=0;
   forever #5 clk=~clk;
  end

  initial begin
      rst=0;
   #10 rst=1;
  end

  sram_intf i(clk,rst);
  sram  uut(.clk(clk),
                .rst(rst),
                .wr_en(i.wr_en),
                .data(i.data),
                .addr(i.addr),
                .data_out(i.data_out)
                );
  sram_tb  test(i);

endmodule

