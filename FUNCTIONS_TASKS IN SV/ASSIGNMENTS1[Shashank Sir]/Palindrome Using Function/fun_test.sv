module test;
    
        function int palindrome(int num);
            int temp,rever,digit;
            rever = 0;
            temp = num;

            while(temp>0) begin
                    digit = temp % 10;
                    rever = rever * 10 + digit;
                    temp = temp / 10;
                end

             return (rever == num);
        endfunction


        initial begin
            int n;
                n = 12321;
                if(palindrome(n))
                    $display("%0d is a PALINDROME",n);
                else
                    $display("%0d is a NOT PALINDROME",n);

                n = 12345;
                if(palindrome(n))
                    $display("%0d is a PALINDROME",n);
                else
                    $display("%0d is a NOT PALINDROME",n);
        end
endmodule
