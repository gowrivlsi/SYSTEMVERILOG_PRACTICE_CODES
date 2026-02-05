//`include "sram_env.sv"
class sram_test2_read;
  sram_env e1;
  virtual sram_intf i5;
  string op="read";
  string ty="increment";

    function new(virtual sram_intf i5);
      this.i5=i5;
    endfunction

    task test2();
       e1=new(i5,op,ty);
       e1.env;
     endtask
endclass
