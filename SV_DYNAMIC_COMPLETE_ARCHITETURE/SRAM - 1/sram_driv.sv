class sram_driv;
    sram_pkt p2;

    mailbox #(sram_pkt)m3;//g2d
    virtual sram_intf I;

        function new(mailbox#(sram_pkt)m3, virtual sram_intf I);
                this.m3  = m3;
                this.I   = I;
        endfunction

        task driv();
            p2 = new;
            wait(I.rst==1);
                forever begin
                    m3.peek(p2);
                       // @(p2.d_in,p2.addr,p2.wren)
                       @(negedge I.clk)

                       //Without clk block in interface
                       /*
                        I.wren = p2.wren;
                        I.d_in = p2.d_in;
                        I.addr = p2.addr; */

                       //With clocking block
                       
                        I.clk1.wren <= p2.wren;
                        I.clk1.d_in <= p2.d_in;
                        I.clk1.addr <= p2.addr; 
                    p2.print("======FROM DRIVER======");
                end
        endtask
endclass
