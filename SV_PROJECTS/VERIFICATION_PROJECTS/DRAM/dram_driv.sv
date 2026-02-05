class dram_driv;
    dram_pkt p2;
    mailbox #(dram_pkt)g2d;
    virtual dram_intf I;

        function new(mailbox#(dram_pkt) g2d, virtual dram_intf I);
                this.g2d = g2d;
                this.I   = I;
        endfunction


        task driv();
              p2 = new;
                forever begin
                    g2d.peek(p2);

                    //pack to pin
                       @(negedge I.clk)
                        //@(p2.d_in,p2.addr,p2.wren,p2.refresh)
                        I.wren = p2.wren;
                        I.refresh = p2.refresh;
                        I.d_in    = p2.d_in;
                        I.addr    = p2.addr;

                        p2.print("========FROM DRIVER=======");
                end
        endtask
endclass
