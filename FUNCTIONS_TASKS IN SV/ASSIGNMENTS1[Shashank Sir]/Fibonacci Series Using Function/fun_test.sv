module test;

    function automatic int fibo(int n);
             
       if(n == 0)
            return 0;
        else if(n==1)
            return 1;
         else
            return fibo(n-1) + fibo(n-2);            
    endfunction

    initial begin
        for(int i=0; i<=25; i++)
            begin
                $display("fibo[%0d]=%0d",i,fibo(i));
            end
    end

endmodule
