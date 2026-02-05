//==============================================FACTORIAL FUNCTION USING LOOPS==========================================
module fun_test;
    
    function int fact(int n);
        int result;
        result=1;
        for(int i=1;i<=n;i++)
            result*=i;
            return result;
    endfunction
    

    function int fact1(int n);
        int i,result;
        i=1;result=1;

        while(i <= n) begin
                result*=i;
                i++;
            end
            return result;

    endfunction
    initial begin
        for(int i=0;i<=6;i++)
            $display("Factorial of %0d=%0d",i,fact(i));
        #5; $display("===================End Fact=====================");
        for(int i=0;i<=5;i++)
            $display("Factorial of %0d=%0d",i,fact1(i));
        #5; $display("===================End Fact=====================");

    end
endmodule
