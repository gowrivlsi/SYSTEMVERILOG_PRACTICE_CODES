class driver;
        mailbox #(pack) m2;
        mailbox #(pack) m2_sb;
        pack p2;
        int num2;
        
        function new(mailbox #(pack) m2,mailbox #(pack) m2_sb,int num2);
                this.m2 = m2;
                this.m2_sb = m2_sb;
                this.num2 = num2;
        endfunction
        

        task driv();
        repeat(num2)begin
            p2= new;
            m2.get(p2);
            m2_sb.get(p2);
            p2.dis1("p2 -> From Driver_1 Nested Driver");#10;
        end
    endtask

endclass

class driver_1;
    driver d1;
      
    function new(mailbox#(pack) m2,mailbox #(pack) m2_sb,int num2);
        d1=new(m2,m2_sb,num2);
    endfunction
    
    task drive_run();
        d1.driv();
    endtask
endclass
