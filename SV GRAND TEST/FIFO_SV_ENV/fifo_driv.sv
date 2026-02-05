class fifo_driv;
    fifo_pkt p2;
    mailbox #(fifo_pkt) g2d;
    virtual fifo_intf I;
    event g,d;
        function new(mailbox#(fifo_pkt)g2d,virtual fifo_intf I,event g,d);
                this.g2d = g2d;
                this.I   = I;
                this.g   = g;
                this.d   = d;
        endfunction

        task driv();
            p2 = new;
           //wait(I.rst==1) 
            forever begin
                @(g)
                g2d.get(p2);
                @(negedge I.clk)

                //pac to pin
                   I.wr   = p2.wr;
                   I.d_in = p2.d_in;
                   I.rd   = p2.rd;
                   //I.rst  = p2.rst;
                p2.print("=================from driver================");
                ->d;
            end
        endtask
endclass
