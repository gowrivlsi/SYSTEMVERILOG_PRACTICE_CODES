class mux_inmoni;
    mux_pack p3;
    mailbox #(mux_pack) m3;
    virtual mux_intf i;

    function new(mailbox #(mux_pack) m3, virtual mux_intf i);

        this.m3 = m3;
        this.i  = i;
    endfunction

    task bfm();
        p3 = new;

        forever begin
            //pin to pack
             @(i.i0,i.i1,i.i2,i.i3,i.s0,i.s1);
                p3.i0 = i.i0;
                p3.i1 = i.i1;
                p3.i2 = i.i2;
                p3.i3 = i.i3;
                p3.s0 = i.s0;
                p3.s1 = i.s1;

            //BFM 
                case({p3.s0,p3.s1})
                    2'b00 : p3.y = p3.i0;
                    2'b01 : p3.y = p3.i1;
                    2'b10 : p3.y = p3.i2;
                    2'b11 : p3.y = p3.i3;
                endcase

           m3.put(p3);
           p3.print("===========FROM INPUT MONITOR WITH BFM==========");
        end
    endtask
endclass
