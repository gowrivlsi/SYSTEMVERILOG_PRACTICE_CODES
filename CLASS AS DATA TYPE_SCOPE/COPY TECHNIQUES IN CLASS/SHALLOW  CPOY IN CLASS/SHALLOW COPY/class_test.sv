//=======================================================SHALLOOW COPY=============================================================
class packet;
        int a;
        int b;

        function void dis(string name="");
            $display("name=%0s",name);
            $display("a=%0d",a);
            $display("b=%0d",b);
        endfunction
endclass

module top;
    
    packet p1,p2,p3;
    initial begin
        p1=new;
        p2=new;
        p1.dis("Before giving Values=>p1");//a=0 b=0
        p2.dis("Before giving Values=>p2");//a=0 b=0

        p1.a=10;
        p1.b=20;
        p1.dis("After giving Values=>p1");//a=10 b=20
        p2.dis("Before giving Values=>p2");//a=0 b=0

        p2.a=30;
        p2.b=40;
        p1.dis("After giving Values=>p1");//a=10 b=10
        p2.dis("After giving Values=>p2");//a=30 b-40

        //SHALLOW COPY
        p3=new p2;
        p1.dis("After giving Values=>p1");//a=10 b=10
        p2.dis("After giving Values=>p2");//a=30 b-40
        p3.dis("After giving Values=>p3");//a=30 b-40

        p2.a=25;
        p2.b=35;
        p2.dis("After giving Values=>p2");//a=25 b=35
        p3.dis("After giving Values=>p3");//a=30 b-40
    end
endmodule
