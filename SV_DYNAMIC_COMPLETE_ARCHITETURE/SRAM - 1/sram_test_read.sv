`include"sram_env.sv"

class sram_test_read;
    sram_env E;
    virtual sram_intf I;
    string op="read";
    
    string ty="increment";
    //string ty="decrement";
   // string ty= "randomix";
    //string ty="constant";


        function new(virtual sram_intf I);
              this.I=I;
        endfunction


    task test2();
        E = new(I,op,ty);
        E.env();
    endtask

endclass
