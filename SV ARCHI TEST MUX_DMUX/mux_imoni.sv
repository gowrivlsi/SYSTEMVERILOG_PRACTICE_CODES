class mux_imoni;
    mux_pack p3;
    mailbox #(mux_pack) m3;
    virtual mux_intf I;

        function new(mailbox#(mux_pack) m3, virtual mux_intf I);
                this.m3  = m3;
                this.I   = I;
        endfunction


        task imoni();
            p3 = new;
                forever begin
                    //pin to pack
                    @(I.i,I.s);
                    p3.i = I.i;
                    p3.s = I.s;

                    m3.put(p3);
                    p3.print("===========FROM INPUT MONITOR==========");
                end
        endtask
endclass
