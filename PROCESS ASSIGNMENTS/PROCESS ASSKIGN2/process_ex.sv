//===========================================PROCESS EXAMPLE USING AWAIT()==========================================
module process_ex;
    process p1,p2;//it is a built in class used for making the process dynamic
    initial begin
         fork : Fork_Block_1
         //disable Fork_Block_1;
            //1st block
            begin : Block_p1
                p1=process::self();
                #4 $display("PROCESS1 STS1",$time);
                #2 $display("PROCESS1 STS2",$time);
                #3 $display("PROCESS1 STS3",$time);
            end

            //2nd block
            begin : Block_p2
                p1.await;
                p2=process::self();
                #2 $display("PROCESS2 STS1",$time);
                #6 $display("PROCESS2 STS2",$time);
                #8 $display("PROCESS2 STS3",$time);
                #1 $display("PROCESS2 STS4",$time);
            end
                //#0;
            begin
            end

  
          join_any
          #2 $display("PROCESS3 STS1",$time);
    end
endmodule
