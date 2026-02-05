class scoreboard;
    pack p3,p4;
    monitor1 m1;
    monitor2 m2;
    mailbox #(pack) m3,m4;
    int num3;

    function new(mailbox#(pack) m5,mailbox#(pack) m6,int num3);
        m3=m5;
        m4=m6;
        this.num3=num3;
    endfunction

    task comp();
        
        p3=new;
        p4=new;
        repeat(num3)begin
            m3.get(p3);
            p3.dis("==========p3 -> from score board=======");
            m4.get(p4);
            p4.dis("==========p4 -> from score board=======");
            if(p3==p4)
                $display("===========Test Passed from ScoreBoard==========");
            else
                $display("=========Test Failed From ScoreBoard========");#10;
        end
    endtask

endclass
