//============================================VARIOUS TYPE OF WRITING A FUNCTIONS=====================================================
module fun_ex;
    
    int G,M;
        
        //WITH Arguments
        function int sum(input int a,b);
            sum = a + b;
            $display("sum=%0d a=%0d b=%0d",sum,a,b);
        endfunction

        //WITHOUT ARGUMENTS
        function byte mul;
            input byte a,b;
            //mul= a * b;
            $display("mul=%0d a=%0d b=%0d",mul,a,b);
            return a*b;
        endfunction

        //WITH INPUT OUTPUT PORTS
        function integer sub(input int a,b,output int c);
            c = a - b;
            $display("a=%0d b=%0d c=%0d",a,b,c);
        endfunction

       //WITH INPUT OUTPUT INSIDE FUNCTION
       function int div;
            input int a,b;
            output int d,e;
            d=a/b;
                $display("a=%0d b=%0d div=%0d",a,b,d);
            e=a**b;
                $display("a=%0d b=%0d Power=%0d",a,b,e);
       endfunction

       //USING VOID 
        function void S;
            $display("SAI IS A GOOD GIRL");
        endfunction

        //CALLING ALL FUNTIONS
        initial begin
            G=sum(8,4);
            $display("SUM G=%0d",G);
            G=mul(5,4);
            $display("MUL G=%0d",G);
            void'(sub(8,4,G));
            $display("SUB G=%0d",G);
            void'(div(8,4,G,M));
            $display("DIV G=%0d M=%0d",G,M);
            S();

        end
endmodule
