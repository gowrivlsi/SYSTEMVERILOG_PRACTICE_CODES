class moni;
 
 packet p4;
 mailbox#(packet) m2s;
 virtual inter i;
 event e3,e4;

 function new(mailbox#(packet)m2s,virtual inter i,event e3,e4);
   this.m2s=m2s;
   this.i=i;
   this.e3=e3;
   this.e4=e4;
 endfunction

 task moni;
  p4=new;

  forever 
    begin
     @(e3)
     @(i.dout)

     p4.dout=i.dout;
     m2s.put(p4);
     p4.print("From    Monitor");
     ->e4;
    end

 endtask



endclass
