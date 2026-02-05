class mux_oumoni;
    mux_pack p4;
    mailbox #(mux_pack) m4;
    virtual mux_intf i;

    function new(mailbox #(mux_pack) m4 , virtual mux_intf i);
            this.m4 = m4;
            this.i  = i;
    endfunction


    task omoni();
        p4 = new;

        forever begin
            //pin to pack 
            @(i.y);
            p4.y = i.y;

            m4.put(p4);
            p4.print("=========FROM OUTPUT MONITOR==========");
        end
    endtask
endclass
