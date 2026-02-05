//=============================================NESTED/AGREGATED/HIERACHY CLASS================================================
class pack1;
    int a;
    int b;


endclass

class back1;
    pack1 p1;

    int c;
    int d;

    function void dis(string name="");
        $display("Name = %0s",name);
        $display("a=%0d",p1.a);
        $display("b=%0d",p1.b);
        $display("c=%0d",c);
        $display("d=%0d",d);
    endfunction

endclass

module test;
    
    back1 b1;

    initial begin
        b1=new;
        b1.p1=new;

        b1.p1.a=10;
        b1.p1.b=20;
        b1.c   =30;
        b1.d   =40;
        b1.dis("PACK1 NESTED OF BACK1");
    end
endmodule
