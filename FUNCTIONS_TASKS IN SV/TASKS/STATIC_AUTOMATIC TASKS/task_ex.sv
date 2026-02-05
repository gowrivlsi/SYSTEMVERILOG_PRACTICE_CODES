//================================================STATIC_AUTOMATIC TASKS==============================================
module task_ex;
    
    task dis1();
                 int a;
       static    int b;
       automatic int c;
       a++;
       b++;
       c++;
       $display("a=%0d b=%0d c=%0d",a,b,c);
    endtask

     task static dis2();
                 int a;
       static    int b;
       automatic int c;
       a++;
       b++;
       c++;
       $display("a=%0d b=%0d c=%0d",a,b,c);
    endtask

     task automatic dis3();
                 int a;
       static    int b;
       automatic int c;
       a++;
       b++;
       c++;
       $display("a=%0d b=%0d c=%0d",a,b,c);
    endtask


    initial begin
        repeat(6) begin
            dis1();
        end
        #5; $display("=====================end dis1====================");

        repeat(6) begin
            dis2();
        end
        #5; $display("=====================end dis2====================");

            
        repeat(6) begin
            dis3();
        end
        #5; $display("=====================end dis3====================");


    end
endmodule
