module test;

    task automatic fibo(input int n,output int result);
            int r1,r2;
       if(n == 0)
            result= 0;
        else if(n==1)
            result= 1;
         else begin
            fibo(n-1,r1);
            fibo(n-2,r2);
            result =r1 + r2;
            end
    endtask

    initial begin
        int fibo_result;
        for(int i=0; i<=25; i++)
            begin
                fibo(i,fibo_result);
                $display("fibo[%0d]=%0d",i,fibo_result);
            end
    end

endmodule
