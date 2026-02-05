`include"test.sv"

program tb(inter i);

 test t;
 int covered,total;

 initial
   begin
     t=new(i);
     t.test;
   end

    
endprogram
