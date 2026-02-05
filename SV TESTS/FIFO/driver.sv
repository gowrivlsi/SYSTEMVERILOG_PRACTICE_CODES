class driv;

packet p2;
mailbox#(packet) g2d;
virtual inter i;
event e1,e2;

function new(mailbox#(packet) g2d,virtual inter i,event e1,e2);
    this.g2d=g2d;
    this.i=i;
    this.e1=e1;
    this.e2=e2;
endfunction

task driv;
 p2=new;
  
  forever
   begin
    @(e1)
    g2d.get(p2);
    @(negedge i.clk)

    i.rd=p2.rd;
    i.wr=p2.wr;
    i.din=p2.din;
    p2.print("From    Driver");
    ->e2; 
   end
endtask

endclass
