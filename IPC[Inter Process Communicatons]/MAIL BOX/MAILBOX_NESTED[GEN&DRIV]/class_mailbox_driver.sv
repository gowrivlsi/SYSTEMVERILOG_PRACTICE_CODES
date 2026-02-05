class driver;
        mailbox #(pack) m2;
        pack p2=new;
        
        function new(mailbox #(pack) m2);
                this.m2 = m2;
        endfunction
        
        /*
        task receive();
            m2.get(p2);
        endtask */
endclass

class driver_1;
    driver d1;
    int num2;
   
    function new(mailbox#(pack) m2,int num2);
        d1=new(m2);
        this.num2    =num2;
    endfunction


    task driv();
        repeat(num2)begin
           // d1.receive();
           d1.m2.get(d1.p2);
            d1.p2.dis1("p2 -> From Driver_1 Nested Driver");#10;
        end
    endtask
endclass
