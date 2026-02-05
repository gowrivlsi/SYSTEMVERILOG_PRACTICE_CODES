/*==========================================================CONTRAINTS TYPES===========================================================
                    12 types

                    1] inside  [syntax]: constraint c1{d_in inside{[10:50]};}
                    2] inline  [syntax]: assert (r1.randomize() with{d_in inside{[60:80]};});
                    3] soft    [syntax]: constraint c3{soft d_in inside{[10:50]};} 
                    4] if else [syntax]: rand bit en;[declare 1st]
                                         constraint c3{if(en==1)
                                                         addr%2==1;
                                                       else 
                                                         addr%2==0;}

                    5] implication [syntax]: LHS -> RHS constraint c4{(range==low)  -> (d_in inside{[10:50]});
                                                                      (range==mid)  -> (d_in inside{[51:100]});
                                                                      (range==high) -> (d_in inside{[101:150]});
                                                                      }
 
                    6] foreach  [syntax]:   
                    7] unique   [syntax]: constraint c7{unique{w_en,rd_en};}
                        ======================*/
class ram;
    rand bit   [31:0] d_in;
    rand logic [31:0] addr;
    rand bit  w_en,rd_en;
    rand bit en;
    rand enum {low, mid, high}range;
    rand bit [31:0] m [10];

      //Constraint declaration
       
       //for data in
        //constraint c1{d_in inside{[10:50]};}//{soft d_in inside{[10:50]};}

        //for Addr
        constraint c2{addr inside{[5:60]};}
        //Using if else
        constraint c3{if(en==1)
                        addr%2==1;
                      else 
                          addr%2==0;}

         //implication
         constraint c4{(range==low)  -> (d_in inside{[10:50]});
                       (range==mid)  -> (d_in inside{[51:100]});
                       (range==high) -> (d_in inside{[101:150]});
                       }

         //foreach
            //constraint c6{m inside{[50:100]};}
            constraint c5{foreach(m[i])
                           if(i%2==0)
                               m[i]%2==1;
                           else
                               m[i]%2==0;
                         }

            constraint c6{foreach(m[i])
                                m[i] inside {[50:100]};
                            }

          //unique type
            constraint c7{unique{w_en,rd_en};}
        
        //function
         function void dis1(string n="");
           
            $display("Name=%0s",n);
            $display("Enum Range=%s",range);
            $display("Data_in=%0d",d_in);
            $display("Addr=%0d",addr);
            $display("W_rn=%d",w_en);
            $display("rd_en=%d",rd_en);
            $display("Enable=%d",en);
            $display("M Array=%p",m);
            $display("W_rn=%d",w_en);
            $display("rd_en=%d",rd_en);
        endfunction
endclass

//==========================================TOP MODULE============================================================
module top;
    ram r1;

        initial begin
            r1=new;
           /*
           repeat(5) begin
           assert (r1.randomize());
           r1.dis1("Ram 1st");
           end */
            //r1.c2.constraint_mode(0);//disabling the addr[0 -> disable 1 -> enable]
            //r1.c1.constraint_mode(0);//disabling the d_in
           repeat(8) begin
           //assert (r1.randomize() with{soft d_in inside{[60:80]};soft d_in inside{[90:100]};});
           assert (r1.randomize());
           r1.dis1("Ram 1st");
           end

        end
endmodule
