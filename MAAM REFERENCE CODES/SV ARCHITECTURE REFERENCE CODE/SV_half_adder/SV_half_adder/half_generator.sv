//it used to generate the stimulus

class half_gen;
   half_packet p1;
   int num;
   mailbox#(half_packet)  m1;


   function new(mailbox#(half_packet) m1,int num);
        this.m1=m1;
        this.num=num;
  endfunction



    task gen();
      p1=new;
        repeat(num)
           begin
             p1.randomize();
             p1.print("FROM GENERATOR");
             m1.put(p1);
            #10;
            end
     endtask
      
   

endclass
