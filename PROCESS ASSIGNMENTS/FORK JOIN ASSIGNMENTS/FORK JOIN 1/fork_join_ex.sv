module fork_join_ex;
initial fork : Block_1
disable Block_1;

         fork
            //1st block
            begin
                #4 $display("PROCESS1 STS1",$time);
                #2 $display("PROCESS1 STS2",$time);
                #3 $display("PROCESS1 STS3",$time);
            end

            //2nd block
            begin
                #2 $display("PROCESS2 STS1",$time);
                #6 $display("PROCESS2 STS2",$time);
                #8 $display("PROCESS2 STS3",$time);
                #1 $display("PROCESS2 STS4",$time);
            end

            //3rd block 

            begin 
                #3 $display("PROCESS3 STS1",$time);
                #6 $display("PROCESS3 STS2",$time);
                #5 $display("PROCESS3 STS3",$time);
            end
        join
                #4 $display("PROCESS4 STS1",$time);
    join

//fork join 2
        initial begin : Block_2
        bit d1=0;
        bit d2=0;
        bit d3=0;
         fork
            //1st block
            begin
                #4 $display("PROCESS1 STS1",$time);
                #2 $display("PROCESS1 STS2",$time);
                #3 $display("PROCESS1 STS3",$time);
                d1=1;
            end

            //2nd block
            begin
                #2 $display("PROCESS2 STS1",$time);
                #6 $display("PROCESS2 STS2",$time);
                #8 $display("PROCESS2 STS3",$time);
                #1 $display("PROCESS2 STS4",$time);
                d2=1;
            end

            //3rd block             

            begin 
                #3 $display("PROCESS3 STS1",$time);
                #6 $display("PROCESS3 STS2",$time);
                #5 $display("PROCESS3 STS3",$time);
                d3=1;
            end

        join_none// join_any
        //wait fork; [For Normal fork_join]
        wait (d1 || d2 || d3);
       // disable fork;
                #4 $display("PROCESS4 STS1",$time);

    end
endmodule
