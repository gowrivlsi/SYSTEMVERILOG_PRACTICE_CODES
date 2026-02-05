class pack;
    rand byte unsigned i0,i1,i2,i3;
    rand byte unsigned s0,s1;
    bit y;
    
        function void dis1(string n="");
             $display("Name : %0s",n);
             $display("Mux_Inputs : i0=%0d | i1=%0d | i2=%0d | i3=%0d",i0,i1,i2,i3);
             $display("Mux_output : y=%0d",y);
        endfunction
endclass

class back;
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
                p1.dis1("p1 -> From Back Nested Pack ");#10;
            end
        endtask
endclass
