program half_tb(half_intf i);
  half_env  e1;

  initial begin
   e1=new(i);
   e1.env();
   end

 
endprogram
