//=================================================PROCESS ASSIGNMENT=================================================================
module process_ex;
    process p1,p2,p3;//it is a built in class used for making the process dynamic
    initial begin
         fork : Fork_Block_1
         //disable Fork_Block_1;
            //1st block
            begin : Block_p1
                p1=process::self();//:: SCOPE RESALUTION
                #4 $display("PROCESS1 STS1",$time);
                #2 $display("PROCESS1 STS2",$time);
                #3 $display("PROCESS1 STS3",$time);
            end

            //2nd block
            begin : Block_p2
                p2=process::self();
                #2 $display("PROCESS2 STS1",$time);
                #6 $display("PROCESS2 STS2",$time);
                #8 $display("PROCESS2 STS3",$time);
                #1 $display("PROCESS2 STS4",$time);
            end

            //3rd block 

            begin : Block_p3
                p3=process::self();
                #3 $display("PROCESS3 STS1",$time);
                #6 $display("PROCESS3 STS2",$time);
                #5 $display("PROCESS3 STS3",$time);
            end

            //PROCESS CALLING
            begin : Controller_p1
                //PROCESS P1
                //wait(p1!=null);
                $display("%s",p1.status);
                #2 p1.suspend();
                $display("%s",p1.status);
                #7 p1.resume();
                $display("%s",p1.status);
                #4 p1.kill();
                $display("%s",p1.status);
            end


            begin : Controller_p2    
                //PROCESS P2
                //wait(p2!=null);
                $display("%s",p2.status);
                #5 p2.suspend();
                $display("%s",p2.status);
                #10 p2.resume();
                $display("%s",p2.status);
                #15 p2.kill();
            end

            begin : Disable_boock
                 //disable Controller_p1;
                 disable Block_p2;
                 disable Block_p3;
                 disable Controller_p2;
            end
        join
                #4 $display("PROCESS4 STS1",$time);

    end
endmodule
