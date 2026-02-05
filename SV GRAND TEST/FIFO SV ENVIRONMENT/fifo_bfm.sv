class fifo_bfm;
    fifo_pkt p3;
    mailbox #(fifo_pkt) g2b;
    virtual fifo_intf I;

    bit[7:0] mem[7:0];
    bit [$clog2(8):0]wr_ptr,rd_ptr;

    //bit full,empty;
    int count,i;

    function new(mailbox#(fifo_pkt)g2b,virtual fifo_intf I);
        this.g2b = g2b;
        this.I = I;
    endfunction

    task bfm();
        p3 = new;
        forever begin
         g2b.get(p3);
            @(p3.d_in,p3.wr,p3.rd)
           p3.clk=I.clk;
           p3.rst=I.rst;
           p3.full=I.full;
           p3.empty=I.empty;
           
           if(p3.wr && !p3.rd && !p3.full)
                begin
                    mem[wr_ptr]<=p3.d_in;
                    wr_ptr<=wr_ptr+1;
                    count<=count+1;
                end
            else
                if(!p3.wr && p3.rd && !p3.empty)
                    begin
                        p3.d_out<=mem[rd_ptr];
                        rd_ptr<=rd_ptr+1;
                        count<=count-1;
                    end
                else
                    if(p3.wr && p3.rd && !p3.full && !p3.empty)
                        begin
                            mem[wr_ptr]<=p3.d_in;
                            wr_ptr<=wr_ptr+1;
                            count<=count+1;
                            p3.d_out<=mem[rd_ptr];
                            rd_ptr<=rd_ptr+1;
                            count<=count-1;
                        end

         g2b.put(p3);
         p3.print("==========From BFM============");
        end
    endtask
endclass
