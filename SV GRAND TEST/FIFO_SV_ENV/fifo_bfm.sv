class fifo_bfm;
    fifo_pkt p3;
    mailbox #(fifo_pkt)g2b,b2s;
    virtual fifo_intf I;

    byte mem[$:7];
    //bit [$] wr_ptr,rd_ptr;
    event d,m;

        function new(mailbox #(fifo_pkt) g2b,b2s,virtual fifo_intf I,event d,m);
            this.g2b = g2b;
            this.b2s = b2s;
            this.I   = I;
            this.d   = d;
            this.m   = m;
        endfunction

        task bfm();
            p3=new;
            forever begin
                @(d)
                g2b.get(p3);
               // @(posedge I.clk)
                //@(p3.d_in,p3.wr,p3.rd,p3.clk,p3.rst)
                p3.clk   = I.clk;
                p3.rst   = I.rst;
                p3.full  = I.full;
                p3.empty = I.empty;

                if(!I.rst)
                 begin
                    mem.delete;
                    p3.d_out=0;
                 end

               else if(p3.wr && !p3.rd && !p3.full)
                   begin
                      mem.push_front(p3.d_in);
                   end
               else if(p3.rd && !p3.wr && !p3.empty)
                    begin
                      //@(posedge I.clk)
                      p3.d_out=mem.pop_back;
                    end
               
               // @(posedge I.clk)
               b2s.put(p3);
               p3.print("===============From BFM===============");
               ->m;
             end

       endtask
endclass
