class driver;
    pack p2;
    mailbox #(pack) m2;
    int num2;
    
    extern function new(mailbox#(pack)m2,int num2);

    task driv();
        p2=new;
        repeat(num2)begin
            m2.peek(p2);
            p2.dis("p2 -> From Driver");#10;
        end
    endtask
endclass

function driver::new(mailbox#(pack) m2,int num2);
    this.m2     =m2;
    this.num2   =num2;
endfunction
