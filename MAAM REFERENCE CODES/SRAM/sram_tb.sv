`include "sram_test1.sv"//write
`include "sram_test2_read.sv"//read

program sram_tb(sram_intf i);
  
  sram_test1_write t1;
 sram_test2_read  t2;

  initial begin
    t1=new(i);
    t1.test1;
 //   t2.test2;
  end
endprogram
