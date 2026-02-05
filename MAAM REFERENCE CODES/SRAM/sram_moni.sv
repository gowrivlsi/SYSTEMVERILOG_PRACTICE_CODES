class sram_moni;
   sram_packet1 p4;
   mailbox#(sram_packet1) m2s;
   virtual sram_intf i3;

   function new(mailbox#(sram_packet1) m2s,virtual sram_intf i3);
     this.m2s=m2s;
     this.i3=i3;
   endfunction

   task moni;
      p4=new();
        wait(i3.rst==1)
         forever begin
           @(i3.data_out)
             p4.data_out=i3.data_out;
             m2s.put(p4);
             p4.print("FROM OUTPUT MONITOR");
         end
    endtask

endclass
