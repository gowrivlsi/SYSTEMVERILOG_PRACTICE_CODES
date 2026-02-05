`include "sram_packet.sv"
`include "sram_generator.sv"
`include "sram_driver.sv"
`include "sram_bfm.sv"
`include "sram_cov.sv"
`include "sram_moni.sv"
`include "sram_sb.sv"

class sram_env;
 sram_generator g1;
 sram_driver d1;
 sram_bfm b1;
 sram_moni o1;
 sram_sb s1;
 sram_cov c1;
 string op,ty;
 
 mailbox#(sram_packet1) m1,m2,m3,m4,m5;
 virtual sram_intf i4;
    function new(virtual sram_intf i4,string op,ty);
      this.i4=i4;
      this.op=op;
      this.ty=ty;
  endfunction

  function void build();
     m1=new();
     m2=new();
     m3=new();
     m4=new();
     m5=new();

     g1=new(m1,m5,op,ty,i4);
     d1=new(m1,i4);
     b1=new(m2,i4);
     c1=new(m5,i4);
     o1=new(m3,i4);
     s1=new(m2,m3);
   endfunction

   task env;
      build();
      fork 
         g1.gen;
         d1.driv;
         b1.bfm;
         c1.cov;
         o1.moni;
         s1.sb;
      join_any
   endtask
   
endclass

