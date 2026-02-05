//===================================================8 bit SUM differencs==================================================
module task_test;
    

    task s_d(input byte a,b);
        byte sum;
        byte signed diff;

        sum = a + b;
        diff= a - b;
        $display("Input: a=%0d b=%0d |SUM=%0d|Diff=%0d",a,b,sum,diff);
    endtask

    initial begin
        s_d(8'd30,8'd20);
        s_d(8'd25,8'd20);
        s_d(8'd40,8'd50);
        s_d(8'd70,8'd20);
    end
endmodule
