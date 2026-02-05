//To Generate and randomize the stimulus 

class half_gen;
    half_pack p1;
    mailbox #(half_pack) m1;
    int num;

    function new(mailbox#(half_pack) m1, int num);
        this.m1 = m1;
        this.num = num;
    endfunction

    task gen();
        p1 = new;
        repeat(num)begin
            assert(p1.randomize());
            p1.print("From Genrator");
            m1.put(p1);
            #10;
        end
    endtask
endclass
