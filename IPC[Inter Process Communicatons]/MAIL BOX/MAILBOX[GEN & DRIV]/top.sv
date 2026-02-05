`include"class_packet.sv"
`include"class_generator.sv"
`include"class_driver.sv"

module top;
    
    generator g;
    driver d;
    mailbox#(pack) m;

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
