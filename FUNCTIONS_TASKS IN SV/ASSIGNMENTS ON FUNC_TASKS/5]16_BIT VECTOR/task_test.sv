//===============================================16 BIT VECTOR POSITIONING OF 1'S=====================================
module task_test;
    shortint a;

    task position(input shortint a);
        for(int i=0;i < 16; i++)
            if(a[i]==1)
                $display("Position=%0d",i);
    endtask

    initial begin
        a = 16'b1011_1110_1000_0011;
        position(a);
    end
endmodule
