//=====================================================FORK JOIN=======================================================
module fork_join();
    //fork_join
    initial begin : Block_1
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

            //3rd block               2,3,4,6,8,9,9,14,16,17,21(out of the loop)
            begin 
                #3 $display("PROCESS3 STS1",$time);
                #6 $display("PROCESS3 STS2",$time);
                #5 $display("PROCESS3 STS3",$time);
            end
        join
                #4 $display("PROCESS4 OUT OF THE LOOP STS1",$time);
    end
//fork join_any
    initial begin : Block_2
    disable Block_2;
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

            //3rd block             //2,3,4,6,8,9,9,13(out of the loop),14,16,17

            begin 
                #3 $display("PROCESS3 STS1",$time);
                #6 $display("PROCESS3 STS2",$time);
                #5 $display("PROCESS3 STS3",$time);
            end
        join_any
                #4 $display("PROCESS4 OUT OF THE LOOP STS1",$time);

    end 

//fork join_none
    initial begin : Block_3
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

            //3rd block            2,3,4(out of the loop),4,6,8,9,9,14,16,17

            begin 
                #3 $display("PROCESS3 STS1",$time);
                #6 $display("PROCESS3 STS2",$time);
                #5 $display("PROCESS3 STS3",$time);
            end
        join_none
                #4 $display("PROCESS4  OUT OF THE LOOP STS1",$time);

    end

endmodule
