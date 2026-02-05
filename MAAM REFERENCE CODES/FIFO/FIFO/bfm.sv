class bfm;
 
packet p3;
mailbox#(packet) g2b;
mailbox#(packet) b2s;
virtual inter i;
byte mem[$:7];
bit full,empty;
event e2,e3;

function new(mailbox#(packet) g2b,b2s,virtual inter i,event e2,e3);
 this.g2b=g2b;
 this.b2s=b2s;
 this.i=i;
 this.e2=e2;
 this.e3=e3;
endfunction

task bfm;
p3=new;

forever
 begin
   @(e2)
   g2b.get(p3);
   //full=(mem.size==8);
   //empty=(mem.size==0);

   //@(p3.din or p3.wr or p3.rd)

   p3.clk=i.clk;
   p3.rst=i.rst;
   p3.full=i.full;
   p3.empty=i.empty;

   if(!i.rst)
     begin
        mem.delete;
        p3.dout=0;
     end

   else if(p3.wr && !p3.rd && !p3.full)
       begin
          mem.push_front(p3.din);
       end
   else if(p3.rd && !p3.wr && !p3.empty)
        begin
          p3.dout=mem.pop_back;
        end

   b2s.put(p3);
   p3.print("From       BFM");
   ->e3;
 end

endtask


endclass
