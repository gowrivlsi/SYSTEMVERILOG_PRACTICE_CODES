module test;
    
        task palindrome(input int num,output bit result);
            int temp,rever,digit;
            rever = 0;
            temp = num;

            while(temp>0) begin
                    digit = temp % 10;
                    rever = rever * 10 + digit;
                    temp = temp / 10;
                end

             if(rever == num)
                 result = 1;
             else
                 result = 0;
        endtask


        initial begin
            int n;
            bit res;
                n = 12321;
                palindrome(n,res);
                if(res)
                    $display("%0d is a PALINDROME",n);
                else
                    $display("%0d is a NOT PALINDROME",n);

                n = 12345;
                palindrome(n,res);
                if(res)
                    $display("%0d is a PALINDROME",n);
                else
                    $display("%0d is a NOT PALINDROME",n);
        end
endmodule
