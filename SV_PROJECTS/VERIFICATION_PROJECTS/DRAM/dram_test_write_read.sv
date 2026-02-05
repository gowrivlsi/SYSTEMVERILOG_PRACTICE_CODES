`include"dram_env.sv"

class dram_test_write_read;
    dram_env E;
    virtual dram_intf I;

    string ope = "write_read";

    //string typ = "increment";
    string typ = "decrement";
    //string typ = "randomxie";
    //string typ = "constant";

        function new(virtual dram_intf I);
            this.I = I;
        endfunction

        task write_read_test();
            E = new(I,ope,typ);
            E.env();
        endtask
endclass
