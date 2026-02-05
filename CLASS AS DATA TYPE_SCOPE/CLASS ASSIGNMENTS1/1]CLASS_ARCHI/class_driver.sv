//===========================================CLASS DRIVER PACKET=======================
`include"class_gen.sv"
class driver;
    trans t2;
    int r;
        
    function new(trans t,int m);
        this.t2 = t;
              r=m;
    endfunction

    task dir();
       // $display("===============DRIVERCLASS=====================");
       repeat(r) begin
       t2.sig("From Driver Half_Adder Singls t2");#10;
       end
               
    endtask
endclass
