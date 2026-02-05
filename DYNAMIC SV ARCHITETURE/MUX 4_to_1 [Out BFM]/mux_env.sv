class mux_env;
    mux_gen     G;
    mux_driv    D;
    mux_io_moni IO;
    mux_sb      S;
    
    //creating mailbox
        mailbox #(mux_pack) G2D,IO2S;

    virtual mux_intf I;
    int n = 11;

    function new(virtual mux_intf I);
        this.I = I;
    endfunction

    task env();
        G2D = new;
        IO2S=new;
        G  = new(G2D,n);
        D  = new(G2D,I);
        IO = new(IO2S,I);
        S  = new(IO2S);

        //Calling All Class Tasks
            fork
                G.gen();
                D.driv();
                IO.io_moni();
                S.sb();
            join
    endtask

endclass
