class full_adder_driv;
    full_adder_pack p2;
    mailbox #(full_adder_pack) m2;
    virtual full_adder_intf i;

        function new(mailbox #(full_adder_pack) m2, virtual full_adder_intf i);
            this.m2 = m2;
            this.i  = i;
        endfunction

        task driv();
            p2 = new;
                forever begin
                    m2.get(p2);
                    p2.print("=====FROM DRIVER=====");

                    //pack to pin
                    @(p2.a,p2.b,p2.cin);
                    i.a     = p2.a;
                    i.b     = p2.b;
                    i.cin   = p2.cin;
                end
        endtask
endclass
