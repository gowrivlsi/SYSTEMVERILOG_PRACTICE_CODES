class sram_driver;
   sram_packet1 p2;
   mailbox#(sram_packet1) d2g;
   virtual sram_intf i1;

   function new(mailbox#(sram_packet1) d2g,virtual sram_intf i1);
      this.d2g=d2g;
      this.i1=i1;
   endfunction

   task driv;
     p2=new();
      // wait(i1.rst==1)
         forever 
            begin
             d2g.get(p2);
            //  @(p2.data,p2.addr,p2.wr_en)
            @(negedge i1.clk)
             i1.clk1.wr_en<=p2.wr_en;
             i1.clk1.addr<=p2.addr;
             i1.clk1.data<=p2.data;
             p2.print("FRom driver");
             end
    endtask
endclass
