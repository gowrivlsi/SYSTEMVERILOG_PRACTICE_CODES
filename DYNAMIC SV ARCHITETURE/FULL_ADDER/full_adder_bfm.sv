class full_adder_bfm;
   
    task compute(full_adder_pack in_pkt);
       
        {in_pkt.carry, in_pkt.sum} = in_pkt.a + in_pkt.b + in_pkt.cin;
        in_pkt.print("======FROM BFM====");
    endtask
endclass

