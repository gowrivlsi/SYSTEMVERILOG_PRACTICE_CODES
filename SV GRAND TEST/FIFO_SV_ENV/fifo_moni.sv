class fifo_moni;
    fifo_pkt p4;
    mailbox #(fifo_pkt)m2s;
    virtual fifo_intf I;
    event s,m;

        function new(mailbox#(fifo_pkt)m2s,virtual fifo_intf I,event s,m);
                this.m2s = m2s;
                this.I   = I;
                this.s   = s;
                this.m  = m;
        endfunction

        task moni();
            p4 = new;
                forever begin
                    @(m)
                    @(I.d_out)
                    //@(posedge I.clk)
                    //@(negedge I.clk)

                    //pin to pack
                  // if(I.rd && !I.empty) begin
                    p4.wr = I.wr;
                    p4.rd = I.rd;
                    p4.d_in = I.d_in;
                    p4.full = I.full;
                    p4.empty = I.empty;
                    //@(posedge I.clk)
                    p4.d_out = I.d_out;
                    
                     //@(posedge I.clk)
                    m2s.put(p4);
                    p4.print("==============From monitor==================");
                    ->s;
                  //end
                end
        endtask
endclass
