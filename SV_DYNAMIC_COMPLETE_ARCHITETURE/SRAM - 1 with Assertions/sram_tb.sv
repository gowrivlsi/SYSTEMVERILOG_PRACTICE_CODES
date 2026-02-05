//`include"sram_test1.sv"
`include"sram_test_read.sv"
//`include"sram_test_write_read.sv"


program sram_tb(sram_intf I);
        //sram_test1              t1;
        sram_test_read          t2;
        //sram_test_write_read    t3;

        initial begin
            //t1 = new(I);//write
            t2 = new(I);//read
            //t3 = new(I);//write_read

            //t1.test1();//write
            t2.test2();//read
            //t3.test3();//write_read
        end
endprogram
