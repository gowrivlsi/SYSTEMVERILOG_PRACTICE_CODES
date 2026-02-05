class enco_gen;
    enco_pack p1;
    mailbox #(enco_pack) m1,m2;//m1 for driv m2 for sb
    int num;

    function new(mailbox#(enco_pack)m1,m2, int num);
            this.m1 = m1;
            this.m2 = m2;
            this.num = num;
    endfunction


    task gen();
        p1 = new;

        repeat(num) begin
            assert(p1.randomize());

            m1.put(p1);//DRIV
            m2.put(p1);//SB
            p1.print("=======FROM GENERATOR======");
            #5;
        end
    endtask
endclass
