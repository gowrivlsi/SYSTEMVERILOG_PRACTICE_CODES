class mux_env;
    mux_gen     G;
    mux_driv    D;
    mux_imoni   IM;
    mux_omoni   O;
    mux_sb      S;

    //creating mailbox
        mailbox #(mux_pack) G2D;
        mailbox #(mux_pack) I2S;
        mailbox #(mux_pack) O2S;

        int n = 5;
        virtual mux_intf I;

            function new(virtual mux_intf I);
                this.I  = I;
            endfunction

            task build();
                G2D  =  new;
                I2S  =  new;
                O2S  =  new;
            endtask

            task env();
                build();

                G  = new(G2D,n);
                D  = new(G2D,I);
                IM  = new(I2S,I);
                O  = new(O2S,I);
                S  = new(I2S,O2S);

                    fork
                        G.gen();
                        D.driv();
                        IM.imoni();
                        O.omoni();
                        S.sb();
                    join
            endtask
endclass
