class dram_moni;
    dram_pkt p4;
    mailbox #(dram_pkt) m2s;
    virtual dram_intf I;

        function new(mailbox #(dram_pkt) m2s, virtual dram_intf I);
                this.m2s = m2s;
                this.I   = I;
        endfunction


        task moni();
            p4 = new;
            wait(I.rst==1)
                forever begin
                    //pin to pack
                    //@(I.d_out);
                    @(posedge I.clk)
                    p4.d_out = I.d_out;
                    m2s.put(p4);
                    p4.print("========FROM OUTPUT MONITOR=========");
                end
        endtask
endclass
