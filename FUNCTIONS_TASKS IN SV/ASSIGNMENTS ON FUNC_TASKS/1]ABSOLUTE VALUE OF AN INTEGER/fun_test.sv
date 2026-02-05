//============================================1]Absolute Value Of an Integer===============================================
module fun_test;
    
    int i,j;
        
        function int abs_value(input int a);
            if(a < 0)//return (a < 0)? -a : a;
                return -a;
            else
                return a;
        endfunction


        function int abs_value1(input int b);
            return (b < 0)? -b : b;
        endfunction


        initial begin
            i=-26;
            j=abs_value(i);
            $display("Absolute value %0d=%0d",i,j);

            for(int i=-5; i<5; i++)
                begin
                    $display("Absolute Value %0d=%0d",i,abs_value1(i));
                end
        end
endmodule
