class enco_driv;
    enco_pack p2;
    mailbox #(enco_pack) m3;
    virtual enco_intf I;

        function new(mailbox#(enco_pack)m3,virtual enco_intf I);
                this.m3  =  m3;
                this.I   =  I;
        endfunction
        

        task driv();
            p2 = new;

                forever begin
                    m3.get(p2);

                    //Pack to Pin
                    @(p2.i)
                    I.i  = p2.i;

                    p2.print("======FROM DRIVER=====");
                end
        endtask
endclass
