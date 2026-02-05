interface mux_intf;
    logic [3:0]i;
    logic [1:0]s;
    logic y;

    //DMUX Output
    logic[3:0] d_o;

        modport m_tb(input y, output i, output s);
        //modport d_tb(input d_o);
endinterface
