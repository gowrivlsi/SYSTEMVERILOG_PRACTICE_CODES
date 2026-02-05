class mux_io_moni;
    mux_pack ip3;
    mux_bfm b1;
    mailbox #(mux_pack) im3;
    virtual mux_intf I;

    function new(mailbox #(mux_pack) m3, virtual mux_intf I);
            this.im3  =  m3;

            this.I    =  I;
            b1 = new;
    endfunction

    task io_moni;
        ip3 = new;
            forever begin
                //pin to pack
                @(I.i,I.s,I.y);
                ip3.i  =  I.i;
                ip3.s  =  I.s;
                ip3.y  =  I.y; //Actual Dut output
                
                b1.bfm(ip3);//Calling bfm logic

                im3.put(ip3);
                ip3.print("===========INPUT_OUTPUT_MONITOR=========");
            end
    endtask
endclass
