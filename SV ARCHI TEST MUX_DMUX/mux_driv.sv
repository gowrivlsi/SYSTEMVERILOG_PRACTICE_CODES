class mux_driv;
    mux_pack p2;
    mailbox #(mux_pack) m2;
    virtual mux_intf I;

        function new(mailbox#(mux_pack) m2, virtual mux_intf I);
                this.m2  = m2;
                this.I   = I;
        endfunction


        task driv();
            p2 = new;
                forever begin
                    m2.get(p2);
                    p2.print("======FROM DRIVER======");

                    //pack to pin
                    @(p2.i,p2.s);
                    I.i = p2.i;
                    I.s = p2.s;
                end
        endtask
endclass
