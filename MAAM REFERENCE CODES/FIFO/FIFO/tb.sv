`include"test.sv"

program tb(inter i);

 test t;
 int covered,total;

 initial
   begin
     t=new(i);
     t.test;
   end

 final
   begin
      $display("Total Coverage Report == Coverage=%0f Total=%0d Covered=%0d",t.e.c.cov.get_coverage(covered,total),total,covered);
   end
   
endprogram
