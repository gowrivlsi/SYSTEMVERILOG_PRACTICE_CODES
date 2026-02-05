`include "class_pack_sig.sv"
`include "class_mailbox_pack.sv"
`include "class_mailbox_driver.sv"

module top;
    
    back b;
    driver_1 d_1;
    mailbox #(pack) m;

    initial begin
       m=new;
       b=new(m,5);
       d_1=new(m,5);

       fork
         b.pack1_run();
         d_1.drive_run();
         //b.p_1.gen();
          //d_1.d1.driv();
       join
    end
endmodule
