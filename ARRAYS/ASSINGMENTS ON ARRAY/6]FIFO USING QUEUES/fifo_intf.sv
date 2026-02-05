//========================================FIFO INTERFACE===========================================
interface fifo_intf(input clk,rst);
    parameter w=8,d=8;
    logic[w-1:0]d_in,d_out;
    logic wr,rd,full,empty;
endinterface
