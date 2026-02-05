class sram_gen;
    sram_pkt p1;
    mailbox #(sram_pkt) m1,m2; //m1 for driv m2 for bfm
    int num;

        function new(mailbox #(sram_pkt)m1,m2, int num);
                this.m1  = m1;//for driv
                this.m2  = m2;//for bfm
                this.num = num;
        endfunction

        task gen();
            p1 = new;
               
               repeat(num)begin
                    p1.wren=1;p1.rden=0;
                    //p1.d_in.rand_mode(1);
                    assert(p1.randomize());

                    m1.put(p1);
                    m2.put(p1);

                    p1.print("======FROM GENRATOR - WRITE=====");
                    #15;
                   
                end
               //#15;
                    repeat(num)begin
                    p1.rden=1;p1.wren=0;
                    p1.d_in.rand_mode(0);
                    assert(p1.randomize());

                    m1.put(p1);
                    m2.put(p1);

                    p1.print("======FROM GENRATOR - READ=====");
                    #15;
                    
                end 

        endtask
endclass
