//====================================================HANDLE/CLASS ASSIGNMENT=========================================
class pack;

    int a,b;

    function void dis1(string name="");
        $display("Name=%0s",name);
        $display("a=%0d",a);
        $display("b=%0d",b);
    endfunction
endclass

class back;
    pack p1;
    int c,d;

    function void dis2(string name="");
        p1.a=35; p1.b=45;
        $display("name=%0s",name);
        $display("a=%0d",p1.a);
        $display("b=%0d",p1.b);
        $display("c=%0d",c);
        $display("d=%0d",d);
    endfunction

    //Custom new constructor
        function new(pack p1);//(pack p)
            this.p1=p1;//p1=p;[Means the p1 inside back is the SAME bag as the p2 outside.]
        endfunction
endclass

module test;
    back b1;
    pack p2;

    initial begin
       //2]Method With Custom "new()"
       p2=new();
       b1=new(p2);//b1.p1  and  p2  "Both Point To Same Memory"

        
        /* 1ST Method Direct Method[Without custom new "new()"]
        p2=new;
        b1=new;
        b1.p1=p2;//both p1 & p2 shares same memory[This is one metod to make 2 handle share same memory without using "new()" constructor]*/

        p2.a=10;
        p2.b=20;
        b1.c=30;
        b1.d=40;

        //b1.p1.dis1("packet 1 2nd");
        p2.dis1("packet 1 1st");
        b1.dis2("backet 1");
        p2.dis1("packet 1 2nd");
        //b1.p1.dis1("packet 1 2nd");

    end
endmodule
