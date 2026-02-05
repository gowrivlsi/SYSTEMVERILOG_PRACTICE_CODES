//============================TOP MODULE==================================
`include"class_driver.sv"

module top;
    trans tr;
    genrator g3;
    driver d2;
    //int m;

    initial begin
        tr=new;
        g3=new(tr,5);
        d2=new(tr,5);
        fork
        g3.gen();
        d2.dir();
        join
    end
endmodule
