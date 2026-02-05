`include"sram_pkt.sv"
`include"sram_gen.sv"
`include"sram_driv.sv"
`include"sram_bfm.sv"
`include"sram_iomoni.sv"
`include"sram_sb.sv"
`include"sram_cov.sv"

class sram_env;
    
    sram_gen     G;
    sram_driv    D;
    sram_bfm     B;
    sram_iomoni  M;
    sram_sb      S;
    sram_cov     C;
    string op,ty;

    //creating mailbox
    mailbox #(sram_pkt) G2D,G2B;
    mailbox #(sram_pkt) M2S;

    virtual sram_intf I;
    int n = 8;
        
            function new(virtual sram_intf I,string op,ty);
                this.I = I;
                this.op = op;
                this.ty = ty;
            endfunction

            task build();
                G2D = new;
                G2B = new;
                M2S = new;
            endtask

            task env();
                build();

                G = new(G2D,G2B,n,I,op,ty);
                D = new(G2D,I);
                B = new(G2B,I);
                C = new(G2D,I);
                M = new(M2S,I);
                S = new(G2B,M2S);

                fork
                    G.gen();
                    D.driv();
                    B.bfm();
                    C.cov();
                    M.moni();
                    S.sb();
                join_any
            endtask
endclass
