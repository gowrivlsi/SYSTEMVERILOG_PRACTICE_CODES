//============================================NESTED ASSIGNMENT===================================
class pack;
    
    int a,b;

        function new (int A,B);
            a=A;
            b=B;
        endfunction
endclass

class back;
    pack p1;
    
    int c,d;
    function void dis(string name="");
        $display("name=%0s",name);
        $display("a=%0d",p1.a);
        $display("b=%0d",p1.b);
        $display("c=%0d",c);
        $display("d=%0d",d);
    endfunction

    function new(int A,B,C,D);
            p1=new(A,B);
            c=C;
            d=D;
    endfunction
endclass

module test;
    back b1;
    
    initial begin
        b1=new(100,200,300,400);
        b1.dis("Passing variables nested pack of back");
    end
endmodule
