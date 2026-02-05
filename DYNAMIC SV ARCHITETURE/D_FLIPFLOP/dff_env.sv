class dff_env;
    
    dff_gen     G;
    dff_driv    D;
    dff_bfm     B;
    dff_iomoni  M;
    dff_sb      S;


    //creating mailbox
    mailbox #(dff_pack) G2D,G2B;
    mailbox #(dff_pack) M2S;

    virtual dff_intf I;
    int n = 15;
        
            function new(virtual dff_intf I);
                this.I = I;
            endfunction

            task build();
                G2D = new;
                G2B = new;
                M2S = new;
            endtask

            task env();
                build();

                G = new(G2D,G2B,n);
                D = new(G2D,I);
                B = new(G2B,I);
                M = new(M2S,I);
                S = new(G2B,M2S);

                fork
                    G.gen();
                    D.driv();
                    B.bfm();
                    M.moni();
                    S.sb();
                join_any
            endtask
endclass
