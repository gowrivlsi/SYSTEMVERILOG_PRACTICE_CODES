`include"fifo_env.sv"

class fifo_read_test;
    fifo_env E;
    virtual fifo_intf I;
    string op = "read";

        function new(virtual fifo_intf I);
            this.I=I;
        endfunction

        task read_test();
            E = new(I,op);
            E.env();
        endtask

endclass
