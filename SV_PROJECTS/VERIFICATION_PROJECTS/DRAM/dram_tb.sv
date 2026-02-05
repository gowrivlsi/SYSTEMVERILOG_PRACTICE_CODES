//`include"dram_test_write.sv"
`include"dram_test_read.sv"
//`include"dram_test_write_read.sv"

program dram_tb(dram_intf I);
    //dram_test_write      t1;
    dram_test_read       t2;
    //dram_test_write_read t3;

        initial begin
            //t1 = new(I);//for write
            t2 = new(I);//for read
            //t3 = new(I);//for write_read
            //t1.write_test();
            t2.read_test();
            //t3.write_read_test();
        end
endprogram
