//=========================================================DEEP COPY==========================================================
class pack;

    int a;
    int b;

    function void dis(string n="");
        $display("Name=%0s",n);
        $display("a=%0d",a);
        $display("b=%0d",b);
    endfunction
endclass

class back;
    int c;
    int d;
    
    pack p1=new;
        
        function void dis1(string n="");
            $display("Name=%0s",n);
            $display("a=%0d",p1.a);
            $display("b=%0d",p1.b);
            $display("c=%0d",c);
            $display("d=%0d",d);
        endfunction


        //Custom Deep Method
        function void copy(back b);
            this.p1.a=b.p1.a;
            this.p1.b=b.p1.b;
            this.c=b.c;
            this.d=b.d;
        endfunction
endclass


module top;
    back b1,b2,b3;
    //pack p2;

    initial begin
        b1=new;
        b2=new;
        b3=new;
        b1.p1.dis("Before giving values to =>p1");
        b1.dis1("Before giving values=>b1");
        b2.dis1("Before giving values=>b2");
        b3.dis1("Before giving values=>b3");

        b1.p1.a=10;
        b1.p1.b=20;
        b1.c=30;
        b1.d=40;
        b1.p1.dis("After giving values to =>p1");
        b1.dis1("After giving values=>b1");
        b2.dis1("Before giving values=>b2");
        b3.dis1("Before giving values=>b3");
        

        b2.copy(b1);
        b1.p1.dis("After deep copy giving values to =>p1");
        b1.dis1("After giving values=>b1");
        b2.dis1("After Deep Copying values from b1 to b2 =>b2");

        b1.p1.a=25;
        b1.p1.b=35;
        b1.c=45;
        b1.d=55;
        b1.p1.dis("After deep copy giving values to =>p1");
        b1.dis1("After changing values=>b1");
        b2.dis1("After Deep Copying values from b1 to b2 =>b2");
        
        b3.copy(b1);
        b1.p1.dis("After deep copy giving values to =>p1");
        b1.dis1("After giving values=>b1");
        b3.dis1("After Deep Copying values from b3 to b1 =>b3");
        
        b2.copy(b3);
        b1.p1.dis("After deep copy giving values to =>p1");
        b1.dis1("After giving values=>b1");
        b2.dis1("After Deep Copying values from b3 to b2 =>b2");


    end
endmodule
