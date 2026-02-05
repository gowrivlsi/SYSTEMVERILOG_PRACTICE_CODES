`include "class_mailbox_pack.sv"
`include "class_mailbox_gen.sv"
`include "class_mailbox_drive.sv"

module top;
    generator g;
    driver d;
    mailbox #(pack) m;

    initial begin
        m=new;
        g=new(m,5);
        d=new(m,5);

        fork
            g.gen();
            d.driv();
        join
    end
endmodule
