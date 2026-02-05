//================================================VARIOUS TYPES OF WRITINFG TASKS======================================
module task_ex;
    
    int j,i;

    //WITH ARGUMENTS
        task add(input int a,b,output int y);
            y = a + b;
            $display("add=%0d a=%0d b=%0d",y,a,b);
        endtask

    //INPUT AND OTPUT PORT INSIDE TASK(without arguments)
        task sub;
            input int a,b;
            output int c;
            c = a - b;
            return;
            $display("sub=%0d a=%0d b=%0d",c,a,b);
        endtask

    
        





        //CALLING TASKS
            initial begin
                add(4,5,i);
                $display("ADD=%0d",i);
                sub(8,4,i);
                $display("SUB=%0d",i);
                sub(8,4,j);
                $display("SUB1=%0d",j);
            end
endmodule
