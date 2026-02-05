/*=========================================================CONSTRAINTS TYPES CONTINUED=========================================================

                                                    8] Distributed/Weighted/Set Membership  [Syntax]: constraint c1{d_in dist{15:=8,[20:90]:=30};
                                                                                                                    addr dist{10:/3,[30:90]:/50};}
                                                    9] Static [Syntax]:   static constraint c2{d_in dist{15:=8,[20:90]:=30};
                                                                                               addr dist{10:/3,[30:90]:/50};}

                                                   10] Functions in Constraint [Syntax]:   //Function Call 
                                                                                        constraint c3{d_in==call(addr);} 
                                                                                        function bit[31:0] call(bit [31:0]m);
                                                                                                        if(m%2==0)
                                                                                                            return m - 1;
                                                                                                         else
                                                                                                            return m + 1;
                                                                                         endfunction
                                                                                         //Funtion Call in Cons [ constraint c3{d_in==call(addr);} ]

                                                    11] Bidirectional Constraint
                                                    12] Solve Before Constraint [Syntax]: 



                         
                                                        

*/

//=======================================================CLASS SRAM========================================================
class sram;
    rand bit [31:0] d_in;
    rand bit [31:0] addr;
    rand bit w_en;//rd_en;
    rand bit [1:0] rd_en;
        
        //Constraint Declaration
            
           /* constraint c1{d_in dist{15:=8,[20:90]:=30};
                          addr dist{10:/3,[30:90]:/50};
                         } */
               constraint c4{addr inside{[10:90]};}

         //Static : For Giving Same "Constraint" to the numtile Handle we can enable or disable to any one handle/pointer using "constraint_mode()" it will affect other handles also.
           /*
           static constraint c2{d_in dist{15:=8,[20:90]:=30};
                          addr dist{10:/3,[30:90]:/50};
                         } */

            //Solve Before Constraint
                constraint c5{(w_en==0) -> (rd_en==0);
                                solve w_en before rd_en;
                              }

            constraint c3{d_in==call(addr);}

          //Function Call
            function bit[31:0] call(bit [31:0]m);
                if(m%2==0)
                    return m - 1;
                else
                    return m + 1;
            endfunction


        function void dis(string n="");
            //$display("Name=%0s",n);
            $display("data_in=%0d ADDR=%0d w_en=%0d rd_en=%0d",d_in,addr,w_en,rd_en);
            //$display("w_en=%d",w_en);
            //$display("rd_en=%d",rd_en);
           /*
            $display("Addr=%d",addr);
            $display("w_en=%d",w_en);
            $display("rd_en=%d",rd_en); */
        endfunction
endclass

module top;
    sram s1,s2;
        
        initial begin
            s1=new;
            s2=new;
            //s1.c2.constraint_mode(1);
            repeat(20)begin
               assert(s1.randomize());
                s1.dis("SRAM s1");
            end

            /*
            repeat(40)begin
                assert(s2.randomize());
                s2.dis("SRAM s2");
            end */

        end
endmodule
