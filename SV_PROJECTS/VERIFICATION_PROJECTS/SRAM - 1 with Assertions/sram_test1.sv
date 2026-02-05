`include"sram_env.sv"

class sram_test1;
    sram_env E;
    virtual sram_intf I;
    string op="write";
    
    string ty="increment";
    //string ty="decrement";
   // string ty= "randomix";


        function new(virtual sram_intf I);
              this.I=I;
        endfunction


    task test1();
        E = new(I,op,ty);
        E.env();
    endtask

endclass
