interface fifo_intf(input clk,rst);
    logic [7:0]d_in;
    logic [7:0]d_out;
    logic full,empty,wr,rd;

endinterface
