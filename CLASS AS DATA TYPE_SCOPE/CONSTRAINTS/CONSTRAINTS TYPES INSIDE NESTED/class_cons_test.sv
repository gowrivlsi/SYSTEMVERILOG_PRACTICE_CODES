//==================================================CONSTRAINTS TYPES INSIDE NESTED================================================

//SRAM CLASS
class sram;
    rand bit [31:0] s_in;
    rand bit [31:0] addr;
    rand bit w_en,rd_en;
    rand bit [1:0] sel;
   
    function void dis1(string n="");
        $display("Name=%0s",n);
        $display("Data_in=%d",s_in);
        $display("Addr=%d",addr);
        $display("w_en=%0d",w_en);
        $display("rd_en=%d",rd_en);
        $display("SEL=%0d",sel);
    endfunction

    //CONSTRAINTS DECLARATION
        constraint c1{soft s_in inside{[10:50]};}
        constraint c2{addr inside{[15:65]};}
endclass

//DRAM CLASS
    class dram;
        sram s1;

            rand bit [15:0] d_in;
            rand bit [15:0] d_addr;
            rand bit wr_en,re_en;
            rand bit en;
            rand bit[1:0] sel;



           // constraint c2{d_in inside{[10:90]};}
            //constraint c3{d_addr inside{[5:35]};}

           /*
           constraint c1{if(en==1)
                                d_addr%2==1; 
                            else 
                                d_addr%2==0;    
                            } */


            //Impliction
                constraint c4{(sel==0) -> (s1.s_in inside{8,9,10,11,12});
                              (sel==1) -> (s1.addr inside{13,14,15,16,18});
                              (sel==2) -> (d_in inside{21,22,23,24,25});
                              (sel==3) -> (d_addr inside{27,28,29,30,31});
                             }
            
             function void dis2(string n="");
                $display("Name=%0s",n);
                $display("Data_in=%d",s1.s_in);
                $display("Addr=%d",s1.addr);
                $display("w_en=%0d",s1.w_en);
                $display("rd_en=%d",s1.rd_en);
                $display("Name=%0s",n);
                $display("DRAM_Data_in=%d",d_in);
                $display("DRAM_Addr=%d",d_addr);
                $display("D_w_en=%0d",wr_en);
                $display("D_rd_en=%d",re_en);
                $display("SEL=%0d",sel);
            endfunction
    endclass

module top;
    sram s2;
    dram d1,d2;

        initial begin
            d1=new;
            d1.s1=new;
            s2=new;
            //d1=new;
           /*
           repeat(1) begin
              assert(d1.s1.randomize());
               d1.s1.dis1("SRAM");
               assert(d1.randomize());
                //d1.s1.dis1("SRAM");
                d1.dis2("DRAM");
            end */

             repeat(1) begin
             // assert(d1.s1.randomize() with{s_in inside{[55:85]};});
               assert(d1.s1.randomize()); 
               d1.s1.dis1("SRAM");
               //assert(d1.randomize() with{soft d_in inside{[100:150]}; soft d_addr inside{[1:0]};});
                //d1.s1.dis1("SRAM");
                assert(d1.randomize());
                d1.dis2("DRAM");
            end
        end
endmodule
