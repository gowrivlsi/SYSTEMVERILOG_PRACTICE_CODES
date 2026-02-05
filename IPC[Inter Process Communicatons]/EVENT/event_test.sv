module test;
    
    event e1,e2,e3;

    task gen();
        @e1;
        $display("==================GENERATOR==============");
        $display("gen => Statement1");
        $display("gen => statement2");
        $display("gen => statement3");
        -> e2;
    endtask

    task driv();
        @e3;
        $display("=================Driver=================");
        $display("driv => statement1");
        $display("driv => statement2");
        $display("driv => statement3");
        $display("driv => statement4");
        
    endtask

    task moni;
        
        $display("=================Monitor=================");
        $display("Moni => statement1");
        $display("Moni => statement2");
        $display("Moni => statement3");
        $display("Moni => statement4");
        -> e1;
    endtask

    task sb;
        @e2;
        $display("=================ScoreBoard=================");
        $display("SB => statement1");
        $display("SB => statement2");
        $display("SB => statement3");
        $display("SB => statement4");
        -> e3;
    endtask


    initial begin
       
           fork
                gen();
                driv();
                moni();
                sb();
            join
    end
endmodule
