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
           // wait(I.rst==1);
                forever begin
                    m3.get(p2);

                    //pack to pin
                    //@(p2.d_in,p2.addr,p2.wren,p2.rden)
                    @(negedge I.clk)
                       
                        I.wren = p2.wren;
                        I.rden = p2.rden;
                        I.d_in = p2.d_in;
                        I.addr = p2.addr;
                    p2.print("======FROM DRIVER======");
                end
        endtask
endclass
