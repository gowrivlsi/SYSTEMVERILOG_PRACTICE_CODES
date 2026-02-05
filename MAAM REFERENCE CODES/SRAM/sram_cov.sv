class sram_cov;
   sram_packet1 p1; 
   mailbox#(sram_packet1)  c2g;
   
   virtual interface sram_intf i1;


    

  covergroup  sram@(posedge i1.clk);
     address:coverpoint p1.addr{bins b1[]={[0:7]};}
     data_in:coverpoint  p1.data{bins b2[]={[0:255]};}
     ctr1:coverpoint p1.wr_en{bins b1={0,1};
                          // bins b2=(1=>0);
                          }
  endgroup

  function new(mailbox#(sram_packet) c2g,virtual interface sram_intf i1);
     this.c2g=c2g;
     this.i1=i1;
     sram=new;
   endfunction


  task cov();
    p1=new();
     forever begin
        c2g.get(p1);
       //  sram.sample();
       end
    endtask


  
endclass
