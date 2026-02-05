module logic_test(
                    input clk,rst,a,b,
                    output reg not1,and1,or1,nand1,nor1,xor1,xnor1
                );
    
    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                    not1=0;and1=0;or1=0;nand1=0;nor1=0;xor1=0;xnor1=0;
                end
            else begin
                    not1  = ~a;
                    and1  = a&b;
                    or1   = a|b;
                    nand1 = ~(a&b);
                    nor1  = ~(a|b);
                    xor1  = a^b;
                    xnor1 = ~(a^b);
                 end
        end
endmodule
