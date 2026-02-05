program logic_tb(logic_intf I);
    initial begin
        repeat(10)begin
            {I.a,I.b} = $random;
        #10;
        end
    end

    initial begin
        forever @(posedge I.clk)
            begin
                if(!I.rst)
                    $assertoff;
                else begin
                    $asserton;
                NOT1   : assert(I.a != I.not1)
                         $info("NOT ASSERTION PASSED");
                       else
                         $error("NOT ASSERTION FAILED");
                AND1   : assert(I.a==I.b==I.and1==1 || I.a==I.b==I.and1==0 || ((I.a!=I.b) && (I.and1==0))) 
                         $info("AND ASSERTION PASSED");
                       else
                         $warning("NOT ASSERTION FAILED");
                OR1    : assert(I.a==I.b==I.or1==1 || I.a==I.b==I.or1==0 || ((I.a!=I.b) && (I.or1==1)));

                NAND1  : assert((I.a==I.b==0 && I.nand1==1) || (I.a==I.b==1 && I.nand1==0) || ((I.a!=I.b) && (I.nand1==1)));

                NOR1   : assert((I.a==I.b==0 && I.nor1==1) || (I.a==I.b==1 && I.nor1==0) || ((I.a!=I.b) && (I.nor1==0)));

                XOR1   : assert((I.a==I.b==I.xor1==0) || ((I.a==I.b==1) && (I.xor1==0)) || ((I.a!=I.b) && (I.xor1==1)));

                XNOR1  : assert((I.a==I.b==I.xnor1==1) || ((I.a==I.b==1) && (I.xnor1==1)) || ((I.a!=I.b) && (I.xnor1==0)));
            end
           end
    end

    initial #100 $finish;
endprogram
