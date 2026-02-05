class driver;
    mailbox #(pack) m2;
    int num2;
    pack p3;

        function new(mailbox#(pack)m2,int num2);
            this.m2 = m2;
            this.num2 = num2;
        endfunction

        task driv_pass();
            repeat(num2) begin
                m2.get(p3);
                p3.dis1("p3 -> From Driver");
            end
        endtask
endclass

class driver_1;
    driver d1;

    function new(driver d1);
        this.d1 = d1;
    endfunction

    task driv_pass_1();
        d1.driv_pass();
        d1.p3.dis1(" From Driver_1");
    endtask
endclass
