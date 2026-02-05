`include "class_pack_sig.sv"
`include "class_mailbox_pack.sv"
`include "class_mailbox_driver.sv"
`include "class_sb.sv"

module top;
    
    back b;
    driver_1 d_1;
    mailbox #(pack) m;
    mailbox #(pack) m_sb;

    initial begin
       m=new;
       m_sb=new;
       b=new(m,m_sb,5);
       d_1=new(m,m_sb,5);

       fork
         b.pack1_run();
         d_1.drive_run();
         m_sb.run();
         //b.p_1.gen();
          //d_1.d1.driv();
       join
    end
endmodule
