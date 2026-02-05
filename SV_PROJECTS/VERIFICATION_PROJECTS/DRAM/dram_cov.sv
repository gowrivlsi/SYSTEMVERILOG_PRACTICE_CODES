class dram_cov;
    dram_pkt p6;
    mailbox #(dram_pkt)g2c;//getting from gen sending same mailbox g2d
    virtual dram_intf I;
        
        covergroup dram @(posedge I.clk);
            address   : coverpoint p6.addr{bins b1[]={[0:7]};}
            data_in   : coverpoint p6.d_in{bins b2[]={[0:255]};}
            wr_en     : coverpoint p6.wren{bins b3={0,1};}
            refresh_1 : coverpoint p6.refresh{bins b4={0};} 
        endgroup

        function new(mailbox #(dram_pkt)g2c ,virtual dram_intf I);
                this.g2c = g2c;
                this.I   = I;
                    dram = new;
        endfunction

        task cov();
            p6 = new;
                forever begin
                    g2c.peek(p6);
                    @(p6.d_in,p6.wren,p6.addr,p6.refresh)
                    dram.sample();
                    p6.print("==========FROM COVERAGE===========");
                end
        endtask
endclass
