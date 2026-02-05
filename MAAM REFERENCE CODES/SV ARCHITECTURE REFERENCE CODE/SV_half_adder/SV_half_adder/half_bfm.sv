//it is used to capture input signal and also it is  reference model
//it used to convert pin to packet

class half_bfm;
    half_packet p3;
    virtual half_intf i;
    mailbox#(half_packet) m3;

    function new(mailbox#(half_packet) m3,virtual half_intf i);
      this.m3=m3;
      this.i=i;
     endfunction




    task bfm();
      p3=new;
      forever begin
       //pin to packet
        @(i.a,i.b)
        p3.a=i.a;
        p3.b=i.b;


       //bfm
       {p3.carry,p3.sum}=p3.a+p3.b;

       m3.put(p3);
       p3.print("FROM BFM");


       end
    endtask

endclass
