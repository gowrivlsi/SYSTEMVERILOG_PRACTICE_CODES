class pack1;
    pack p1;
    mailbox #(pack) m1;
    int num1;
        function new(mailbox #(pack) m1,int num1);
            this.m1         =m1;
            this.num1    =num1;
        endfunction

        task gen();
            p1=new;
            repeat(num1)begin
                assert(p1.randomize());
                m1.put(p1);
                p1.dis1("p1 -> From Back Nested Pack ");#5;
            end
        endtask

endclass

class back;
    pack1 p_1;
    pack p2;
    mailbox #(pack) m2;
    int num2;
        function new(mailbox #(pack) m2,int num2);
            p_1 = new(m2,num2);
            this.m2 = m2;
            this.num2 = num2;    
        endfunction

        task gen1();
            p2 = new;
            repeat(num2)begin
            m2.get(p2);
            p2.dis1("p2 ->get(p1) From Back Nested pack1");
            m2.put(p2);
            #5;
            end
        endtask
endclass
