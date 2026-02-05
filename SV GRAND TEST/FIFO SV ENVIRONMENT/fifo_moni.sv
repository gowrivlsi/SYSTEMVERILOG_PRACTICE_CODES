class fifo_moni;
    fifo_pkt p4;
    mailbox #(fifo_pkt) m2s;
    virtual fifo_intf I;

        function new(mailbox#(fifo_pkt)m2s, virtual fifo_intf I);
                this.m2s = m2s;
                this.I = I;
        endfunction

        task moni();
            p4 = new;
            forever begin
                @(I.d_in,I.wr,I.rd)
                
                //pin to pack
                p4.wr = I.wr;
                p4.rd = I.rd;
                p4.d_in = I.d_in;

                m2s.put(p4);
                p4.print("==========From monitor========");
            end
        endtask
endclass
