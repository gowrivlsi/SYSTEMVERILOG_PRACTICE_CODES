class packet;

     bit clk,rst;
     bit rd,wr;
rand byte unsigned din;
     bit full,empty;
     byte unsigned dout;
     byte unsigned temp;

extern function void print(string name="");

constraint c1{din inside{[1:100]};}
constraint c2;

function void post_randomize;
   temp=din;
endfunction
endclass

function void packet::print(string name="");
  $display("%s clk=%0d rst=%0d rd=%0d wr=%0d din=%0d dout=%0d full=%b empty=%b",name,clk,rst,rd,wr,din,dout,full,empty);
endfunction

constraint packet::c2{din!=temp;}
