class gen_pattern;
  rand bit seq[12];   // 12-bit sequence

 /* constraint c_pattern {
    seq == '{0,1,0,0,1,1,0,0,0,1,1,1};
  } */

  constraint c_pattern{
                seq[0] == 0;
                seq[1] == 1;

                foreach(seq[i]) 
                    if(i >= 2 && i <= 3)
                        seq[i] == 0;
                    else if(i >= 4 && i <= 5)
                        seq[i] == 1;
                    else if(i >= 6 && i <= 8)
                        seq[i] == 0;
                    else if(i >= 9 && i <= 11)
                        seq[i] == 1;
            }
endclass

module test;
  initial begin
    gen_pattern g = new();
    assert(g.randomize());
    $display("seq = %p", g.seq);
  end
endmodule
