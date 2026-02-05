class sram;
   rand bit [31:0]data_in;
   rand bit [31:0]addr;
   rand bit w_en,rd_en;
        bit [31:0]data_out;
   rand  bit en;
   rand enum{low,mid,high}range;
   rand bit[31:0] a[10];

       //constraint c1{addr>=10 && addr<=50;}
       //   constraint c2{data_in>=100 && data_in<=500;}

    //   extern constraint c1;
    //   extern constraint c2;

    //inside constraint
        // constraint  c1{soft addr inside{[10:20]};}
       //constraint  c2{data_in%2==0 && data_in inside{[100:500]};}
       //constraint c2{data_in%2==0;}
      // constraint c3{data_in inside{[100:200]};}

      //if_else
       /* constraint c2{if(en==1)
                         addr%2==0;
                      else
                          addr%2==1;
                      }*/

      //implication  lhs->rhs
        constraint c2{(range==low)->(addr inside {[0:100]});
                       (range==mid)->(addr inside {[101:500]});
                       (range==high)->(addr inside {[501:1000]});
                       }


                   //foreach
 
        constraint c3{foreach(a[i])

                             if(i%2==0)
                                 a[i]%2==1;

                                else
                                    a[i]%2==0;
                          }

          constraint c4{foreach(a[i])
                             a[i] inside {[10:100]};}



      constraint c5{unique {w_en,rd_en};}
                     








      /*  function void display(string name="");
          $display("name=%s",name);
          $display("data_in=%d",data_in);
          $display("range=%s",range.name);
          $display("addr=%d",addr);
          $display("w_en=%d",w_en);
          $display("rd_en=%d",rd_en);
          $display("en=%d",en);

          $display("data_out=%d",data_out);
        endfunction*/


endclass

       // constraint sram::c1{addr>=10 && addr<=500;}
       // constraint sram::c2{data_in>=100 && data_in<=500;}




module top;
    sram s1;
       initial begin
          s1=new;
         // s1.c2.constraint_mode(0);
       //  en=1;
            repeat(10)
              begin
            //  assert(s1.randomize()with{addr inside{[10:40]};});
             // s1.display("sram packet");
             assert(s1.randomize());
            // $display("range=%s->addr=%d",s1.range.name,s1.addr);
           //  $display("a=%p",s1.a);
             $display("wr_en=%d,rd_en=%d",s1.w_en,s1.rd_en);
              end
         /*  s1.c2.constraint_mode(1);
            repeat(5)
              begin
              assert(s1.randomize());
              s1.display("sram packet");
              end*/


        end
endmodule   
