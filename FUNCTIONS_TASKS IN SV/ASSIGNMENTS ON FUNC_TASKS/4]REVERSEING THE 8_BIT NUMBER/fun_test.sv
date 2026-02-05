//=======================================================REVERSING THE 8 BIT NUMBER========================================
module fun_test;
    int i,a;

    function byte reverse;
        input byte a;
        for(int i=0;i<8;i++)
            reverse[i]=a[7-i];
            
    endfunction

    initial begin
        a=8'b10010000;
        i=reverse(a);
        $display("INPUT a=%b |Reverse=%b",a,i);
    end

    always begin
        repeat(6) begin
        #5 a= $urandom_range(0,50);
        $display("Original=%0b | Reversed=%0b | Time=%0t",a,reverse(a),$time);
        end
        #50 $stop;
    end
endmodule
