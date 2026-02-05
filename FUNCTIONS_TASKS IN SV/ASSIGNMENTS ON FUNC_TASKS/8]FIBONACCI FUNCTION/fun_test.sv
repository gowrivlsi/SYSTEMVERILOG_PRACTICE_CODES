//=========================================RECURSIVE FIBONACCI FUNCTION=======================================
module fun_test;
    
    function automatic int fibo(int n);
       //return (n <= 2) ? 1 : (fibo(n-1) + fibo(n-2));
       
       if(n == 0)
            return 0;
        else if(n==1)
            return 1;
         else
            return fibo(n-1) + fibo(n-2);//Recursive (call by itself)
            
    endfunction

    initial begin
        for(int i=0; i<=10; i++)
            begin
                $display("fibo[%0d]=%0d",i,fibo(i));
            end
    end
endmodule
