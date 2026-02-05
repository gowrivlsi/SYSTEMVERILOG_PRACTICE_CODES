class generator;
    
    pack p1;
    mailbox #(pack) m1;
    int m;

    function new(mailbox #(pack) m1,int m);
        this.m1=m1;
        this.m=m;
    endfunction

    constraint c1{p1.a>p1.b;}    

    task gen();
        p1=new;
        repeat(m) begin
        assert(p1.randomize());
        m1.put(p1);
        p1.dis("From Generator");
        #10;
        end
    endtask
endclass
