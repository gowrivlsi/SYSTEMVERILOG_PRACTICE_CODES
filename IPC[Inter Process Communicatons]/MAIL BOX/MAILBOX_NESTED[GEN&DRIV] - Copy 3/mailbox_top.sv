`include "class_pack_sig.sv"
`include "class_mailbox_pack.sv"
`include "class_mailbox_driver.sv"

module top;
    pack1 p_2;
    back b;
    driver d;
    driver_1 d_1;
    mailbox #(pack) m;

    initial begin
       m=new;
       p_2 = new(m,5);
       b=new(m,5);
       d=new(m,5);
       d_1=new(m,5);

       fork
           p_2.gen();
           b.gen1();
           d.driv();
           d_1.driv1();
        
       join
    end
endmodule
