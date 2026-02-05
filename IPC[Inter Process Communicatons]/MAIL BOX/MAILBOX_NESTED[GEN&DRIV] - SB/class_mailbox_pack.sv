class pack1;
    pack p1;
    mailbox #(pack) m1;
    mailbox #(pack) m1_sb;
    int num1;
        function new(mailbox #(pack) m1,mailbox #(pack) m1_sb,int num1);
            this.m1         =m1;
            this.m1_sb      =m1_sb;
            this.num1    =num1;
        endfunction

        task gen();
            p1=new;
            repeat(num1)begin
                assert(p1.randomize());
                m1.put(p1);
                m1_sb.put(p1);
                p1.dis1("p1 -> From Back Nested Pack ");#10;
            end
        endtask

endclass

class back;

    pack1 p_1;

        function new(mailbox #(pack) m1,mailbox #(pack) m1_sb,int num1);
            p_1=new(m1,m1_sb,num1);
        endfunction

        task pack1_run();
            p_1.gen();
        endtask
endclass
