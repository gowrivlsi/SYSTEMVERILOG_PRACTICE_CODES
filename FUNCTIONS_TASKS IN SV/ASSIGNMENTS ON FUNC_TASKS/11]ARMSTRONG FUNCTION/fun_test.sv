/*===================================ARMSTRONG NUMBER===================================
An Armstrong Number (also called a Narcissistic Number) is a number that is equal to the sum of its own digits, each raised to the power of the number of digits.
Example for a 3-digit number (like 153):

✔ Count digits → 3
✔ Split digits → 1, 5, 3
✔ Raise each digit to the power of 3:
1**3=1 5**3=125 3**3=27  so 1 + 125 + 27 = 153
Since 153 = original number,
👉 153 is an Armstrong Number.*/

module fun_test;
    int s_arry[10]='{153, 370, 371, 407, 123, 0, 9474, 1634, 8208, 408}; 
   
   function int arm(int num); //function bit arm(int num);
        int temp,sum,digit,n,count;
        sum = 0; count = 0;

        //FOR COUNTING NUMBER OF DIGITS
        n = num;
        while(n > 0) begin 
                n = n / 10;
                count++;
                end
        
        //FOR ARMSTRONG LOGIC
            temp = num;
        while (temp > 0) begin
                digit = temp % 10;
                sum += digit ** count; //sum = sum+(digit ** count)
                temp = temp/10;
                end
        return (sum == num);      
   endfunction


   initial begin
        foreach(s_arry[i]) begin
            if (arm(s_arry[i]))
                $display("%0d is an ARMSTRONG number", s_arry[i]);
            else
                $display("%0d is NOT an Armstrong number", s_arry[i]);
        end
   end

endmodule
