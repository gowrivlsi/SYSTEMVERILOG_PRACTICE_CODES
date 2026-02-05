class mux_omoni;
    mux_pack p4;
    mailbox #(mux_pack) m4;
    virtual mux_intf I;

        function new(mailbox#(mux_pack) m4, virtual mux_intf I);
                this.m4  = m4;
                this.I   = I;
        endfunction


        task omoni();
             p4 = new;
                forever begin
                    //pin to pack
                    @(I.y or I.d_o);#1;
                    $display("y=%0d d_o=%0d",I.y,I.d_o);
                 //   p4.y  =  I.y;
                    p4.d_o = I.d_o;

                    m4.put(p4);
                    p4.print("=========FROM OUTPUT MONITOR=========");

                end
        endtask
endclass
