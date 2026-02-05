class monitor2;
    pack p2;
    mailbox #(pack) m2;
    int num2;

         function new(mailbox#(pack) m2,int num2);
        this.m2=m2;
        this.num2=num2;
    endfunction

    task gen2();
        p2=new;
        
        repeat(num2)begin
            assert(p2.randomize());
            m2.put(p2);
            p2.dis("p2 -> From Monitor 2");#10;
        end
    endtask
endclass
