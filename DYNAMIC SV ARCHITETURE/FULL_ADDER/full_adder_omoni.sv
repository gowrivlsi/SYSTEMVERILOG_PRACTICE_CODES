class full_adder_omoni;
    full_adder_pack p4;
    mailbox #(full_adder_pack) m4;
    virtual full_adder_intf i;

         function new(mailbox #(full_adder_pack) m4, virtual full_adder_intf i);
            this.m4 = m4;
            this.i  = i;
        endfunction
        

        task omoni();
            p4 = new;

            forever begin
                //pin to pac
                @(i.sum,i.carry);
                p4.sum   = i.sum;
                p4.carry = i.carry;

                m4.put(p4);
                p4.print("======FROM OUTPUT_MONITOR=====");
            end
        endtask
endclass
