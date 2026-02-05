class driver;
        mailbox #(pack) m3;
        pack p3;
        int num3;
        
        function new(mailbox #(pack) m3,int num3);
                
                this.m3 = m3;
                this.num3 = num3;
                
                
        endfunction
        

        task driv();
        repeat(num3)begin
            p3= new;
            repeat(num3)begin
            m3.get(p3);
            p3.dis1("p3 ->get(p3) From Driver 1");#10;
            m3.put(p3);
            p3.dis1("p3 ->put(p3) From Driver 1.2");
            end
        end
    endtask

endclass

class driver_1;
    pack p4;
    mailbox #(pack) m4;
    int num4;

    function new(mailbox#(pack) m4,int num4);
        this.m4 = m4;
        this.num4 = num4;
        
    endfunction
    
    task driv1();
        p4 = new;
        repeat(num4)begin
        m4.get(p4);
        p4.dis1("p4 -> From Driver_1 1");#10;
        m4.put(p4);
        p4.dis1("p4 -> From Driver_1 1.2");
        end
    endtask
endclass
