//=======================================================CLOCK GENERATION USING ALL LOOPS=======================================
module clk_gene;
    reg clk,clk1,clk2,clk3,clk4,clk5,clk6,clk7=0;
    bit a[20];//foreach loop
    int i=0;//For While and Do while

    //Using always Block
    initial clk=0;
    always #5 clk=~clk;
   
    //Using forever Loop
    initial begin
        clk1=0;
    forever #8 clk1=~clk1;
    end

    //Using repeat Loop
    initial begin
        clk2=0;
        repeat(20)begin
          #5 clk2=~clk2;
        end
    end

    //Using for Loop
    initial begin
        clk3=0;
        for(int i=0;i<20;i=i)begin
                #5 clk3=~clk3;
            end
    end

    //Using foreach Loop
    initial begin
    clk4=0;
        foreach(a[i])begin
            #5 clk4=~clk4;
        end
    end

    //Using while Loop
    initial begin
    clk5=0;
        while(1) begin
                #5 clk5=~clk5;
                //i++;//i=i;
            end
    end

    //Using do while Loop
    initial begin
        clk6=0;
        do begin
            #5 clk6=~clk6;
            i++;//i=i;
            end while(1);
    end

    //Using fork join
    initial fork
       forever #5 clk7=~clk7; 
    join

     initial 
    #250 $stop;
endmodule
