class pack;
    mailbox #(pack) m1;
    rand byte unsigned i0,i1,i2,i3;
    rand byte unsigned s0,s1;
    bit y;
    int num1;
    
        function void dis1(string n="");
             $display("Name : %0s",n);
             $display("Mux_Inputs : i0=%0d | i1=%0d | i2=%0d | i3=%0d",i0,i1,i2,i3);
             $display("Mux_output : y=%0d",y);
        endfunction

        function new(mailbox#(pack)m1,int num1);
            this.m1 = m1;
            this.num1 = num1;
        endfunction

        task gen_pack();
            repeat(num1) begin
                assert(this.randomize());
                m1.put(this);
                dis1("From Packet");
            end
        endtask
endclass

class back;
    pack p2;
    mailbox #(pack) m2;
        
    function new(mailbox #(pack) m2);
        this.m2 = m2;
    endfunction

    task back_gen();
        m2.peek(p2);
        p2.dis1("p2 -> From Back");
    endtask
endclass

