class sram_bfm;
   sram_packet1 p3;
   mailbox#(sram_packet1) b2s;
   virtual sram_intf i2;
   reg [7:0]mem1[7:0];


      function  new(mailbox#(sram_packet1) b2s,virtual sram_intf i2);   
        this.b2s=b2s;
        this.i2=i2;
      endfunction

      task  bfm;
         p3=new();
          wait(i2.rst==1)
            forever begin
              @(i2.wr_en,i2.data,i2.addr)
              p3.wr_en=i2.wr_en;
              p3.data=i2.data;
              p3.addr=i2.addr;

              //bfm logic=>replica of dut or vip
              if(p3.wr_en==1)
                 mem1[p3.addr]=p3.data;
              else
                 p3.data_out=mem1[p3.addr];

            b2s.put(p3);
            end
      endtask
endclass
