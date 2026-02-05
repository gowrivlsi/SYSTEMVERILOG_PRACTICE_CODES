interface sram_intf(input clk,rst);
    logic [7:0]data;
    logic wr_en;
    logic [2:0]addr;
    logic [7:0]data_out;

    modport dut(input clk,rst,wr_en,data,addr,output data_out);
    modport tb(input clk,rst,data_out,output data,wr_en,addr);
 
    clocking  clk1@(negedge clk);
      default input #2 output #3;
      input data_out;
      output data,wr_en,addr;
    endclocking
 


endinterface
