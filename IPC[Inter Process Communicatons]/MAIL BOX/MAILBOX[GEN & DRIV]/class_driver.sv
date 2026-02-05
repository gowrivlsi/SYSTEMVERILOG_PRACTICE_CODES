class driver;
    pack p2;
    mailbox #(pack) m2;
    int n;

    function new(mailbox #(pack) m2,int n);
        this.m2=m2;
        this.n=n;
    endfunction

    task driv();
        p2=new;
        
        repeat(n) begin
            p2.dis("Driver -> Before Getting Values");
            m2.get(p2);
            p2.dis("Driver -> After Getting Values");
            #10;
        end
    endtask
endclass
