//==============================================SHALLOW COPY IN NESTED CLASS=========================================
class pack;
    
    int a;
    int b;

    function void dis(string name="");
        $display("name=%0s",name);
        $display("a=%0d",a);
        $display("d=%0d",b);
    endfunction
endclass

class back;
    int c;
    int d;
    
    pack p1=new;

    function void dis1(string n="");
        $display("name=%0s",n);
        $display("a=%0d",p1.a);
        $display("b=%0d",p1.b);
        $display("c=%0d",c);
        $display("d=%0d",d);
    endfunction
endclass


module top;
    
    back b1,b2;

    initial begin
        //p1=new;
        b1=new;
        b2=new;
        //b2=new b1;//it only copy the one handle to othe handle of same class but not the object[properties]  
        b1.dis1("Before giving values=>b1");
        b2.dis1("Before giving values=>b2");

        b1.p1.a=10;
        b1.p1.b=20;
        b1.c=30;
        b1.d=40;
        b1.dis1("After giving values");//a=10 b=20 c=30 d=40
        b2.dis1("Before Copying values");//a=0 b=0 c=0 d=0
        

        // DEEP COPY
        b2.p1.a=b1.p1.a;
        b2.p1.b=b1.p1.b;
        b2.c=b1.c;
        b2.d=b1.d;
        
        b1.dis1("After Cpying values b1 to b2=>b1");//a=10 b=20 c=30 d=40
        b2.dis1("After Copying values b1 to b2=>b2");//a=10 b=20 c=30 d=40 //a=10 b=20 c=0 d=0

        b1.p1.a=25;
        b1.p1.b=35;
        b1.c=45;
        b1.d=55;
        b1.dis1("After Cpying values b1 to b2=>b1");//a=25 b=35 c=45 d=55
        b2.dis1("After Copying values b1 to b2=>b2");//a=10 b=20 c=30 d=40 //a=10 b=20 c=0 d=0

    end
endmodule
