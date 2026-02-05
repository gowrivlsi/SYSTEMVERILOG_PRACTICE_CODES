//============================TOP MODULE==================================
`include"class_driver.sv"

module top;
    genrator g;
    driver d;

    initial begin
        
        g=new(5);
        d=new(5);
        d.t2=g.t1;

        fork
        g.gen();
        d.dir();
        join
    end
endmodule
