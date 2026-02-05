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
           b.p_1.gen();
           b.gen1();
           d_1.driv1();
           d_1.d1.driv();
        
       join
    end
endmodule
