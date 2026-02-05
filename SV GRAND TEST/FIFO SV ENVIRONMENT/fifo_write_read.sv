`include"fifo_env.sv"

class fifo_write_read;
    fifo_env E;
    virtual fifo_intf I;   
    string op="write";
 
   

        function new(virtual fifo_intf I);
              this.I=I;
        endfunction


    task test();
        E = new(I,op);
        E.env();
    endtask

endclass
