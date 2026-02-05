//========================================================FUNCTION USING ALU=====================================
module func_alu(input bit[31:0] a,b,
                input bit [2:0]sel,
                output bit[61:0] y,A,B,C,D,G,R,T
                
               );

//int A,B,C,D,G,R,T;
    
 //Arthemetic Operation 
    //Function Addition
        function int add;
            input int a,b;
            return a + b;
        endfunction

    //Function Sub
        function int sub;
            input int a,b;
            return a - b;
        endfunction

    //Function Div
        function int div;
            input int a,b;
            return a / b;
        endfunction

    //Function Multiplication
        function int mul;
            input int a,b;
            return a*b;
        endfunction
     

   //Logical oprator
        function int log;
            input int a,b;
            output int O,D,F,J,H,S,E;

            O = a && b;
            D = a || b;
            F = ! a;
            J = a & b;
            H = a | b;
            S = a ^ b;
            E = ~(a ^ b);
        endfunction
    //Calling Funcrion
        /*
        always_comb
            begin
                $display("Additon       =%0d",add(4,5));
                $display("Subtraction   =%0d",sub(9,5));
                $display("Division      =%0d",div(16,8));
                $display("Multiplication=%0d",mul(4,5));
            end
        */

        always_comb
        begin
            case(sel)
                3'b000 : y = add(a,b);
                3'b001 : y = sub(a,b);
                3'b010 : y = mul(a,b);
                3'b011 : y = div(a,b);
                3'b100 : y = log(a,b,A,B,C,D,G,R,T);
            endcase
        end
endmodule
