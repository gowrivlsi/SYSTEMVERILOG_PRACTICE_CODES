class sram_iomoni;
    sram_pkt p5;
    mailbox #(sram_pkt)m5;//m2s
    virtual sram_intf I;

        function new(mailbox #(sram_pkt) m5, virtual sram_intf I);
                this.m5 = m5;
                this.I  = I;
        endfunction

        task moni();
            p5 = new;
                forever begin
                    //pin to pack
                        //@(I.d_in,I.addr,I.wren,I.rden)
                        @(posedge I.clk)

                        p5.wren = I.wren;
                        
                        p5.d_in = I.d_in;
                        p5.addr = I.addr;
                        p5.d_out = I.d_out;

                        m5.put(p5);
                        p5.print("======FROM MONITOR======");
                        
                end
        endtask
endclass
