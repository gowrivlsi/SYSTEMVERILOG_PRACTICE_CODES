program logic_tb(logic_intf I);
    initial begin
        repeat(10)begin
            {I.a,I.b} = $random;
        #10;
        end
    end
    
    
    //For Not Gate
    sequence s_not;
        I.a!=I.not1;
    endsequence

    //For And Gate
    sequence s_and;
        (I.a && I.b && I.and1) || (!I.a && !I.b && !I.and1) || ((I.a!=I.b) && (I.and1==0)); 
    endsequence

    //For Or Gate
    sequence s_or1;
        (I.a && I.b && I.or1);
    endsequence

    sequence s_or2;
        (!I.a && !I.b && !I.or1);
    endsequence

    sequence s_or3;
        ((I.a!=I.b) && (I.or1==1));
    endsequence

    //For Xor Gate
    sequence s_xor1;
        (I.a && I.b && !I.xor1);
    endsequence

    sequence s_xor2;
        ((I.a==I.b==1) && (I.xor1==0));
    endsequence
    
    sequence s_xor3;
        ((I.a !=I.b) && (I.xor1==1));
    endsequence


    //Property 
    //For Not
    property p_not;
        //@(posedge I.clk)
        @(negedge I.clk)
        disable iff(!I.rst)
        s_not;
    endproperty

    //For And 
    property p_and;
        //@(posedge I.clk)
        @(negedge I.clk)
        disable iff(!I.rst)
        s_and;
    endproperty

    //For Or
    property p_or;
        //@(posedge I.clk)
        @(negedge I.clk)
        disable iff(!I.rst)
        s_or1 or s_or2 or s_or3;
    endproperty

    //For Xor
    property p_xor;
        //@(posedge I.clk)
        @(negedge I.clk)
        disable iff(!I.rst)
        s_xor1 or s_xor2 or s_xor3;
    endproperty
    
   
        
        //ASSERT PROPERTY
            NOT : assert property (p_not);
            //(@(posedge I.clk)(p_not));
            AND : assert property(p_and);//(@(posedge I.clk)p_and);
            OR  : assert property(p_or);//(@(posedge I.clk)p_or);
            XOR : assert property(p_xor);//(@(posedge I.clk)p_xor);
   
    
    initial #100 $finish;
endprogram
