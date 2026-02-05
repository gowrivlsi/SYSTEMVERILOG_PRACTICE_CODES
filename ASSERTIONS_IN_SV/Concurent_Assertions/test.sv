module test(clk,rst);
    input clk,rst;
    reg a,b;
    reg [3:0]c;

    initial begin
        repeat(10) begin
            #1;
        void'(std::randomize(a,b,c));
        $display("a=%0d | b=%0d ",a,b);
        #10;
        end
    end
    

    sequence s1;
         a ##2 !b;
    endsequence
    
    sequence s2(x);//Generic manner
        $rose(x); 
    endsequence

    sequence s3(y);
        $fell(!y);
    endsequence
    
    sequence s4;
        !(a&&b);
    endsequence
    
    sequence s5;
        @(posedge clk)
      
      $fell(a) && $fell(b);
    endsequence


    property p1;
        @(posedge clk)
        if(rst==1)
        s1 
    endproperty

    property p2;
        @(posedge clk)
        if(rst)
            s2(a);
    endproperty

    property p3;
        @(posedge clk)
        disable iff(!rst)
            s3(b);
    endproperty

    property p4(x,y);//Generic Manner
        @(posedge clk)
        if(rst)
        s4;
    endproperty

    property p5(x);
        @(posedge clk)
        if(rst)
       not $isunknown(x);    
    endproperty

    property p6(x,y);
        @(posedge clk)
        if(rst)
            $rose(x) |-> ##[1:2] $rose(y);
    endproperty

    property p7;
        @(posedge clk)
        if(rst)
            $stable(a);
    endproperty

    property p8;
        @(posedge clk)
        if(rst)
            $changed(b);
    endproperty

    property p9;
        @(posedge clk)
        if(rst)
            $past(a,2);
    endproperty

     property p10(x,y);
        @(posedge clk)
        if(rst)
            $rose(x) |=> ##[1:2] $rose(y);
    endproperty

    property p11;
        @(posedge clk)
        if(rst)
        $onehot(c);
    endproperty
    
    property p12;
        @(posedge clk)
        if(rst)
        $onehot0(c);
    endproperty
    
    property p13;
        @(posedge clk)
        if(rst)
            first_match(c ##1 c);
            //first_match(!a ##2 c);
            //first_match(b ##1 a);
    endproperty

    property p14;
        @(posedge clk)
        if(rst)
            $rose(a) |-> ##1 $rose(b) within ##2 $fell(!a);
    endproperty

    
   

    A : assert property(p1);
    B : assert property(p2);
    C : assert property(p3);
    D : assert property(p4(a,b));
    E : assert property(@ (posedge clk) not(a || b))
            $info("***************************PASS*******************");
        else
            $error("**************************FAIL*******************");
    F : assert property(p5(a));
    G : assert property(p6(a,b));
    H : assert property(@(posedge clk)s5);
    I : assert property(p7);
    J : assert property(p8);
    K : assert property(p9);
    L : assert property(p10(a,b));
    M : assert property(@(posedge clk) a |-> b);
    N : assert property(@(posedge clk) a |=> b);
    O : assert property(p11);
    P : assert property(p12);
    Q : assert property(p13);
    R : assert property(p14);

endmodule
