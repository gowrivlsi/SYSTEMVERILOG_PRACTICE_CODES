`include"fifo_pkt.sv"
`include"fifo_gen.sv"
`include"fifo_driv.sv"
`include"fifo_bfm.sv"
`include"fifo_moni.sv"
`include"fifo_sb.sv"


class fifo_env;
    
    fifo_gen    G;
    fifo_driv   D;
    fifo_bfm    B;
    fifo_moni   M;
    fifo_sb     S;

    string op;

     //creating mailbox
    mailbox #(fifo_pkt) G2D,G2B;
    mailbox #(fifo_pkt) M2S;
    
     virtual fifo_intf I;
     int n = 8;

     function new(virtual fifo_intf I,string op);
                this.I = I;
                this.op = op;
            endfunction

            task build();
                G2D = new;
                G2B = new;
                M2S = new;
            endtask

            task env();
                build();

                G = new(G2D,G2B,n,I,op);
                D = new(G2D,I);
                B = new(G2B,I);
               // C = new(G2D,I);
                M = new(M2S,I);
                S = new(G2B,M2S);

                fork
                    G.gen();
                    D.driv();
                    B.bfm();
                   // C.cov();
                    M.moni();
                    S.sb();
                join_any
            endtask


endclass
