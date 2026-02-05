`include"env.sv"

class test;

 env e;
 virtual inter i;
 string op="read";

 function new(virtual inter i);
   this.i=i;
 endfunction

 task test;
  e=new(i,op);
  e.env;
 endtask

endclass
