class full_adder_imoni;
    full_adder_pack p3;
    full_adder_bfm b1;
    mailbox #(full_adder_pack) m3;
    virtual full_adder_intf i;
        

        function new(mailbox #(full_adder_pack) m3, virtual full_adder_intf i);
            b1 = new;
            this.m3 = m3;
            this.i  = i;
        endfunction

        task imoni();
            
            p3 = new;
            //b1 = new;

            forever begin
                //pin to pack 
                @(i.a,i.b,i.cin);
                 p3.a   = i.a; 
                 p3.b   = i.b;
                 p3.cin = i.cin;

                 b1.compute(p3); //Calling BFM task

                 m3.put(p3);
                 p3.print("=======FROM INPUT MONITOR======");
            end
        endtask

endclass
