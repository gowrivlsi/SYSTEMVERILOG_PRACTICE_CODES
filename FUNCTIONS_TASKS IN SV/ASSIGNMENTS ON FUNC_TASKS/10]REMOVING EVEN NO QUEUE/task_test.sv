//============================================REMOVING EVEN NUMBERS FROM QUEUE=========================================
module task_test;
     int q_arry[$]='{0,2,3,4,5,6,7,8,9,10};

    task remove_even(inout int q[$]);
       int i;
       i=0;
       while(i < q.size()) 
           if(q[i] % 2 == 0)
               q.delete(i);
           else
               i++;
    endtask

    task remove_even1(inout int q[$]);
        int q_arry[$];

            foreach(q[i]) 
                 if (q[i] % 2 != 0)  // keep only odd numbers
                    q_arry.push_back(q[i]);
                    q = q_arry; // replace old queue
                    
    endtask

    task remove_even2(inout int q[$]);
        q = q.find with (item % 2 != 0);   // keep only odd numbers
    endtask
    
    

    initial begin
       
        $display("Original=%0p",q_arry);
        remove_even1(q_arry);
        $display("After=%0p",q_arry);
    end
endmodule
