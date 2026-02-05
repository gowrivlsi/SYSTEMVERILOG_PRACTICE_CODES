//=================================================COUNTS THE NUMBERS OF 1's====================================
module fun_test;
    int b,j;

    function [3:0] count(input bit[3:0]b);
         count=0;
        for(int i=0; i <4; i++)
            if(b[i]==1)
                count++;
            //return count;
    endfunction

    initial begin
        b=4'b1011;
        j=count(b);
        $display("Input=%0d Number of 1's=%0d",b,j);

        b=4'b0011;
        j=count(b);
        $display("Input=%0d Number of 1's=%0d",b,j);

        b=4'b0001;
        j=count(b);
        $display("Input=%0d Number of 1's=%0d",b,j);

        b=4'b0000;
        j=count(b);
        $display("Input=%0d Number of 1's=%0d",b,j);

    end
endmodule
