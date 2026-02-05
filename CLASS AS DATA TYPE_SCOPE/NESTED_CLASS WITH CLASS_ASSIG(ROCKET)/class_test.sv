//======================================================NESTED CLASS WITH HANDLE/CLASS ASSIGNMENT==============================
//Rocket CLass
class rock;
    int a,b;

    function void dis1(string name="");
        $display("Name=%0s",name);
        $display("a=%0d",a);
        $display("b=%0d",b);
    endfunction
endclass

//Packet Class
class pack;
    //nested rocket of handle r2
    rock r2;
    int a,b;
    
    function void dis2(string n="");
        r2.a=10; r2.b=20;
        $display("Name=%0s",n);
        $display("a=%0d",r2.a);
        $display("b=%0d",r2.b);
    endfunction

     //Costum new contructor
        function new(rock r2);
            this.r2=r2;
        endfunction

endclass

//Backet Class
class back;
    //nested rocket of handle r3
    rock r3;

    int a,b;

     function void dis3(string n="");
        r3.a=30; r3.b=40;
        $display("Name=%0s",n);
        $display("a=%0d",r3.a);
        $display("b=%0d",r3.b);
     endfunction

     //Costum new contructor
        function new(rock r3);
            this.r3=r3;
        endfunction
endclass

//Top Module
module test;
    pack p1;
    back b1;
    rock r1;
    initial begin
        r1=new();
        //Rocket handle r1,r2,r3 are shares same memory
        p1=new(r1);//p1.r2.r1=new;
        b1=new(r1);//b1.r3.r1=new;

        r1.a=25;
        r1.b=35;

        r1.dis1("Rocket1 1st");
        p1.dis2("Packet 1st");
        b1.dis3("Backet 1st");

        r1.a=20;
        r1.b=30;
        r1.dis1("Rocket1 2nd");
        p1.dis2("Packet 2nd");
        b1.dis3("Backet 2nd");

        p1.r2.a=15;
        p1.r2.b=28;
        r1.dis1("Rocket1 3rd");
        p1.dis2("Packet 3rd");
        b1.dis3("Backet 3rd");

        b1.r3.a=18;
        b1.r3.b=38;
        r1.dis1("Rocket1 4th");
        p1.dis2("Packet 4th");
        b1.dis3("Backet 4th");
    end
endmodule


