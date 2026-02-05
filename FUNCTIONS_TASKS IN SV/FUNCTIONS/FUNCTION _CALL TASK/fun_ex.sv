//=================================================FUNCTION CALLING TASK INSIDE A FUNCTION=================================
module fun_ex;
    task a;
        $display("Task Calling Inside A fun");
    endtask

    function int fun;
        a();
    endfunction

    initial begin
        fun();
    end
endmodule
