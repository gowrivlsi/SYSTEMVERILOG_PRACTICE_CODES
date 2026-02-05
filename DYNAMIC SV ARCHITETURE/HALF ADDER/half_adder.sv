module half_adder(
                input a,b,
                output reg s,c
                );

    always@(a,b)
        begin
            if(~a && ~b)
                begin
                    s=0; c=0;
                end
            else if(~a && b)
                begin
                    s=1; c=0;
                end
            else if(a && ~b)
                begin
                    s=1; c=0;
                end
            else if(a && b)
                begin
                s=0; c=1;
                end
        end
endmodule
