`include "fifo_write_read.sv"

program fifo_tb(fifo_intf I);
    fifo_write_read t1;
    //fifo_env E;
    //string op; 
     initial begin
        t1 = new(I);
        t1.test();
        #10;
     end
    
endprogram
