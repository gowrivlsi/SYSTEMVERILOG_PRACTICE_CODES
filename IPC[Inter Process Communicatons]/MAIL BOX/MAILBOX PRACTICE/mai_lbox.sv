//================================================================MAIL_BOX====================================================
module mail_box;
    //1]Generic MailBox
    mailbox m1=new;//For Unbounded mail box
    //mailbox m1=new(3);//For Bounded Mailbox
    
    //2]Parameterized Mail_Box
    //mailbox #(string)m1=new;

    task gen();
        //string a;
        //a="Sai_Meghana USN 77";
        int a,b;
        //a=10;
        //$display("a=%0d",a);
        repeat(5) begin
        a=$urandom_range(10,20);
        b=$urandom_range(20,30);
        m1.put(a);
        m1.put(b);
        //m1.try_put(a);
        $display("a=%0d b=%0d",a,b);
        //$display("b=%0d",b);
        end
        $display("No Of Elemments in : %0d",m1.num);
    endtask


    task driv();
        //string b;
        int c,d;
        repeat(5) begin
        m1.get(c);
        m1.get(d);
       // m1.peek(b);
       //m1.try_get(b);
       //m1.try_peek(b);
        $display("c=%0d d=%0d",c,d);
        //$display("d=%0d",d);
        end
        $display("No Of Elemments in : %0d",m1.num);
    endtask

    initial begin
        gen();
        driv();
    end
endmodule
