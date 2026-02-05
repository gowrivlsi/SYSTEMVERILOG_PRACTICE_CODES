module test;
    
    function bit prime(int num);
        
        if(num < 2)
            return 0;
        
        for(int i=2;i<= num/2;i++)
            begin
                if(num % i == 0)
                    return 0;
                    break;
            end
        return 1;
    endfunction



    initial begin
        int n;
        n = 7;
        if(prime(n))
            $display("%0d Is a PRIME NUMBER",n);
        else
            $display("%0d Is NOT A PRIME NUMBER",n);
    end
endmodule
