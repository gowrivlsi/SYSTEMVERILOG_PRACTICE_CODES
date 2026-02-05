interface dram_intf(input clk,rst);
    logic [7:0]d_in,d_out;
    logic wren,refresh;
    logic [2:0] addr;

        modport tb(input clk,rst,d_out, input addr,d_in,wren,refresh);
endinterface
