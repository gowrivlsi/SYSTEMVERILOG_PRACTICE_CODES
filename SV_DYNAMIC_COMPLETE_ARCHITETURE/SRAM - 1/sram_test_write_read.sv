`include"sram_env.sv"

class sram_test_write_read;
    sram_env E;
    virtual sram_intf I;   
    string op="write_read";
 
    string ty="increment";
    //string ty="decrement";
   // string ty= "randomix";


        function new(virtual sram_intf I);
              this.I=I;
        endfunction


    task test3();
        E = new(I,op,ty);
        E.env();
    endtask

endclass
