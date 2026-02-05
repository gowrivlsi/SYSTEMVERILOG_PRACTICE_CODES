module test;
    
    semaphore s;

    task gen();
        s.get(25);
        $display("==================GENERATOR==============");
        $display("gen => Statement1");
        $display("gen => statement2");
        $display("gen => statement3");
        s.put(30);
    endtask

    task driv();
        s.get(40);
        $display("=================Driver=================");
        $display("driv => statement1");
        $display("driv => statement2");
        $display("driv => statement3");
        $display("driv => statement4");
        s.put(45);
    endtask

    task moni;
        s.get(30);
        $display("=================Monitor=================");
        $display("Moni => statement1");
        $display("Moni => statement2");
        $display("Moni => statement3");
        $display("Moni => statement4");
        s.put(40);
    endtask

    task sb;
        s.get(50);
        $display("=================ScoreBoard=================");
        $display("SB => statement1");
        $display("SB => statement2");
        $display("SB => statement3");
        $display("SB => statement4");
    endtask


    initial begin
        s = new(30);
            fork
                gen();
                driv();
                moni();
                sb();
            join
    end
endmodule
