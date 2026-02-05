class mux_gen;
    mux_pack p1;
    mailbox #(mux_pack) m1;
    int num;

        function new(mailbox#(mux_pack)m1, int num);
            this.m1 =  m1;
            this.num = num;
        endfunction

        task gen();
            p1 = new;

                repeat(num) begin
                    assert(p1.randomize());
                    p1.print("=====FROM GENERATOR====");

                    m1.put(p1);
                    #5;
                end
        endtask
endclass
