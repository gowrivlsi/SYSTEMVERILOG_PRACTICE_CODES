//To Generate and randomize the stimulus 

class half_gen;
    half_pack p1;
    mailbox #(half_pack) m1;
    int num;

    event gen_done;

    function new(mailbox#(half_pack) m1, int num, event gen_done);
        this.m1 = m1;
        this.num = num;
        this.gen_done = gen_done;
    endfunction

    task gen();
        p1 = new;
        repeat(num)begin
            assert(p1.randomize());
            p1.print("From Genrator");
            m1.put(p1);
            -> gen_done; //gen trigger
            #5;
        end
    endtask
endclass
