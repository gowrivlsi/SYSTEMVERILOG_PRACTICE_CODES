class sram_cov;
    sram_pkt c_p;
    mailbox#(sram_pkt) c2g;
    virtual sram_intf I;

        covergroup sram@(posedge I.clk);
            address: coverpoint c_p.addr{bins b1[]={[0:7]};}
            data   : coverpoint c_p.d_in{bins b2[]={[0:255]};}
            wr_en  : coverpoint c_p.wren{bins b3={0,1};}
        endgroup


        function new(mailbox#(sram_pkt)c2g, virtual sram_intf I);
            this.c2g = c2g;
            this.I   = I;
            sram = new;
        endfunction

        sram_env E;

        task cov();
            @(E.e_gen_done);
            c_p = new;
                forever begin
                    c2g.peek(c_p);
                        @(c_p.d_in,c_p.addr,c_p.wren)
               //     sram.sample();
                    c_p.print("========FROM COVERAGE======");
                end
             -> E.e_cov_done;
        endtask
endclass
