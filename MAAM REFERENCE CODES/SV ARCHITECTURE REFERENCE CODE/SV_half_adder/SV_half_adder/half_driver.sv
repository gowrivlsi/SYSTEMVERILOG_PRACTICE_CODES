//it is used to drive the stimulus from generator->dut through virtual interface
//it also converts packet level to pin level

class half_driver;
  half_packet p2;
  mailbox#(half_packet)   m2;
  virtual half_intf i;

    function new(mailbox#(half_packet) m2,virtual half_intf i);
      this.m2=m2;
      this.i=i;
    endfunction

   

      task div();
        p2=new;
        forever begin
        m2.get(p2);
        p2.print("FROM DRIVER");
        //packet level to pin level
         i.a=p2.a;
         i.b=p2.b;
       end
      endtask
        
          
         
endclass
