`include "class_mailbox_pack.sv"
`include "class_mailbox_driver.sv"

module top;
    pack p;
    back b;
    driver d;
    driver_1 d_1;
    mailbox #(pack) m;

    initial begin
       m=new;
       p=new(m,5);
       b=new(m);
       d=new(m,5);
       d_1=new(d);
       fork
          p.gen_pack();
          b.back_gen();
          d_1.driv_pass_1();
       join
    end
endmodule
