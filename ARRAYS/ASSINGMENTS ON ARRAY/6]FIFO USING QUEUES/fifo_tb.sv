//=================================================FIFO_TB===================================================
program fifo_tb(fifo_intf t);
    //For Write Operation
    task write();
        begin
            wait(t.rst==1);
            t.wr=1;
            t.rd=0;
            repeat(8)begin
            t.d_in=$random;#10;
            end
        end
    endtask

    //For Read Operation
    task read();
        begin
            t.rd=1;
            t.wr=0;
        end
    endtask

    //Calling task
    initial begin
        wait(t.rst==1);
        write();
        read();
    end

    initial begin
        $monitor("clk=%0d rst=%0d wr=%0d rd=%0d Data_in=%0d Data_out=%0d Full=%0d Empty=%0d",t.clk,t.rst,t.wr,t.rd,t.d_in,t.d_out,t.full,t.empty);

        #200 $stop;
    end
endprogram
