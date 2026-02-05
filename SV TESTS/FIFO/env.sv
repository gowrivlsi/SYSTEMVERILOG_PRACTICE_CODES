`include"packet.sv"
`include"generator.sv"
`include"driver.sv"
`include"bfm.sv"
`include"monitor.sv"
`include"sb.sv"
//`include"coverage.sv"

class env;

gen g;
driv d;
moni m;
bfm b;
sb s;
//coverage c;

int num=8;
string op;
virtual inter i;
mailbox#(packet) g2d;
mailbox#(packet) g2b;
mailbox#(packet) g2c;
mailbox#(packet) b2s;
mailbox#(packet) m2s;
event e1,e2,e3,e4,e5;

function new(virtual inter i,string op);
 this.i=i;
 this.op=op;
endfunction

function void build();
  g2d=new;
  g2b=new;
  //g2c=new;
  b2s=new;
  m2s=new;
endfunction

task env;

  build();
 g=new(g2d,g2b,g2c,i,e1,num,op);
 d=new(g2d,i,e1,e2);
 b=new(g2b,b2s,i,e2,e3);
 m=new(m2s,i,e3,e4);
 s=new(m2s,b2s,e4);
// c=new(g2c,i);

 fork
   g.gen;
   d.driv;
   b.bfm;
   m.moni;
   s.sb;
   //c.covi;
 join

endtask


endclass
