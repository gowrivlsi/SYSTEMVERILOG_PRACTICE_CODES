class dff_driv;
     dff_pack p2;
     mailbox #(dff_pack)m3;
     virtual dff_intf I;

        function new(mailbox #(dff_pack)m3, virtual dff_intf I);
                this.m3  = m3;
                this.I   = I;
        endfunction


        task driv();
            p2 =  new;
                forever begin
                    m3.get(p2);

                    //pack to pin
                     @(p2.din)

                     
                     I.din = p2.din;

                     p2.print("FROM ->  DRIVER");
                end
        endtask
endclass
