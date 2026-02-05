class dff_gen;
    dff_pack p1;
    mailbox #(dff_pack)m1,m2;//m1 for driv m2 for bfm
    int num;

        function new(mailbox #(dff_pack) m1,m2, int num);
                this.m1     =  m1;//for driver
                this.m2     =  m2;//for bfm
                this.num    =  num;
        endfunction


        task gen();
            p1 = new;
                repeat(num) begin
                    assert(p1.randomize());

                    m1.put(p1);//for drive
                    m2.put(p1);//for bfm

                    p1.print("FROM GENERATOR");
                    #10;
                end
        endtask

endclass
