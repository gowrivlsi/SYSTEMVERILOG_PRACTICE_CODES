//===========================================CLASS DRIVER PACKET=======================
`include"class_gen.sv"
class driver;
    trans t2;
        
     int j;

   function new(int j);
    this.j=j;
   endfunction

    task dir();
        repeat(j) begin
            t2.sig("From Driver Half_Adder Singls t2");
            #10;
       end
               
    endtask
endclass
