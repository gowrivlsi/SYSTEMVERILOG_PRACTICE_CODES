`include"sram_dut.sv"
`include"sram_intf.sv"
`include"sram_tb.sv"
`include"sram_read_assert.sv"

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

    
    sram_intf I(.clk(clk),
               .rst(rst)
                );

  
  sram_dut D(.clk(I.clk),
              .rst(I.rst),
              .d_in(I.d_in),
              .wren(I.wren),
              .addr(I.addr),
              .d_out(I.d_out)
              );

   
    sram_tb T(I.tb);

    sram_read_assert A1(I);
               
endmodule
