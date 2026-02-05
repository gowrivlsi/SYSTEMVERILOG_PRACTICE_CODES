//it is used to capture output signal 
//it used to convert pin to packet


class half_moni;
   half_packet p4;
   mailbox#(half_packet)  m4;
   virtual half_intf i;

   function new(mailbox#(half_packet) m4,virtual half_intf i);
     this.m4=m4;
     this.i=i;
   endfunction


   task moni();
     p4=new;
       forever begin
         @(i.sum,i.carry)
           p4.sum=i.sum;
           p4.carry=i.carry;

           m4.put(p4);
           p4.print("FROM MONITOR");
         end

    endtask
endclass
