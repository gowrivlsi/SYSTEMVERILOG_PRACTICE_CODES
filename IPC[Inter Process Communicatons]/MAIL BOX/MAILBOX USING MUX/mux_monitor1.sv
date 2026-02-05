class monitor1;
    
    pack p1;
    mailbox#(pack) m1;
    int num1;

    function new(mailbox#(pack) m1,int num1);
        this.m1=m1;
        this.num1=num1;
    endfunction

    task gen1();
        p1=new;
        
        repeat(num1)begin
            assert(p1.randomize());
            m1.put(p1);
            p1.dis("p1 -> From Monitor 1");#10;
        end
    endtask
endclass
