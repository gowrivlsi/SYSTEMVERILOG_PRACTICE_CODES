//==========================================Test Bench=============================================
program tcl_tb(tlc_intf t);
    
    //initialization
        task sb();
            begin
                $display("Time = %0t Lights = %s",$time,t.Lights);
            end
        endtask
    initial begin
        wait(t.rst==1);
        //cyle=0
        forever begin
            @(posedge t.clk);
            sb();
        end
    end

    initial begin
        #2500 $stop;
    end
endprogram
