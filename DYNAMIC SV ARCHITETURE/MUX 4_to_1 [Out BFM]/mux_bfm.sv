class mux_bfm;
    
    task bfm(mux_pack b_pkt);
        case (b_pkt.s)
            0 : b_pkt.bf_y =b_pkt.i[0];
            1 : b_pkt.bf_y =b_pkt.i[1];
            2 : b_pkt.bf_y =b_pkt.i[2];
            3 : b_pkt.bf_y =b_pkt.i[3]; 
        endcase

        b_pkt.print("========FROM BFM LOGIC=========");
    endtask
endclass
