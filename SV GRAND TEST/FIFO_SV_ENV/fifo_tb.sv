`include"fifo_read_test.sv"

program fifo_tb(fifo_intf I);
    fifo_read_test r1;
     
     initial begin
        r1 = new(I);
        r1.read_test();
     end
endprogram
