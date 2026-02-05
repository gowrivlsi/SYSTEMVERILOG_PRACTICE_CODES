class mux_env;
    mux_gen     G;
    mux_driv    D;
    mux_inmoni  I;
    mux_oumoni  O;
    mux_sb      S;



    //Creating Mailbox
        mailbox #(mux_pack) G2D;
        mailbox #(mux_pack) I2S;
        mailbox #(mux_pack) O2S;
        
        int n=10;
        virtual mux_intf i;

        function new(virtual mux_intf i);
            this.i = i;
        endfunction

        function void build();
            G2D = new;
            I2S = new;
            O2S = new;
        endfunction

        task env;
            build();
            G = new(G2D,n);
            D = new(G2D,i);
            I = new(I2S,i);
            O = new(O2S,i);
            S = new(I2S,O2S);
            
            fork 
                G.gen();
                D.driv();
                I.bfm();
                O.omoni();
                S.sb();
            join

        endtask

endclass
