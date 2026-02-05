//=====================================================INCREMENTING THE EVERY ELEMENT IN THE FIXED ARRAY===========================================
module task_test;
    int f_arry[10]={0,1,2,3,4,5,6,7,8,9};

    task incre(inout int a[10]);
        for(int i=0;i<10;i++)
            a[i]=a[i]+1;
    endtask

    initial begin
        $display("Before Increment = %p", f_arry);

        incre(f_arry);   // calling the task

        $display("After Increment  = %p", f_arry);
    end
endmodule
