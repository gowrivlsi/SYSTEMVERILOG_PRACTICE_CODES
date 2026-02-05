interface sram_intf(input clk,rst);
    
    logic [7:0] d_in;
    logic [2:0] addr;
    logic [7:0] d_out;
    logic wren,rden;

    modport dut(input clk,rst,addr,d_in,wren,rden, output d_out);
    modport tb(input d_out, output clk,rst,addr,d_in,wren,rden);
endinterface
