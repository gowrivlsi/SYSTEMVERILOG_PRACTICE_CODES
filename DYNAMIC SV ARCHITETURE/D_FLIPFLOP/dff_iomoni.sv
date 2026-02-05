class dff_iomoni;
    dff_pack p4;
    mailbox #(dff_pack) m5;
    virtual dff_intf I;

        function new(mailbox #(dff_pack) m5,virtual dff_intf I);
                this.m5 = m5;
                this.I  = I;
        endfunction

        task moni();
            p4 = new;
                forever begin
                    //pin to pack
                      
                      @(I.q)
                        p4.q = I.q;

                        m5.put(p4);
                        p4.print("FROM -> MONITOR");
                end
        endtask

endclass
