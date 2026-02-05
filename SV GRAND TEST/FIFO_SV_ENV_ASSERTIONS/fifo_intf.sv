interface fifo_intf(input clk,rst);
    logic wr,rd;
    logic [7:0] d_in;
    logic [7:0] d_out;
    logic full,empty;

endinterface
