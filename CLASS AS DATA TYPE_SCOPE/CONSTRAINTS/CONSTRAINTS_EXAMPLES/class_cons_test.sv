//===================================================CONSTRAINT IN CLASS=============================================
class ram;
    rand bit   [31:0] d_in;
    rand logic [31:0] addr;
    rand bit  w_en,rd_en;


      //Constraint declaration
       /*
       //for data in
        constraint c1{d_in>=10 && d_in<=50;}

        //for Addr
        constraint c2{addr>=5 && addr<=60;}
        */
    
    //using extern keyword
         //for data in 
       extern constraint c1;

        //for Addr
       extern constraint c2;

        function void dis1(string n="");
            $display("Name=%0s",n);
            $display("Data_in=%0d",d_in);
            $display("Addr=%0d",addr);
            $display("W_rn=%d",w_en);
            $display("rd_en=%d",rd_en);
        endfunction
endclass


//===========================================================USING EXTERN KEYWORD WRITING OUTSIDE CLASS====================================
        //for data in 
        constraint ram::c1{d_in>=10 && d_in<=50;}

        //for Addr
        constraint ram::c2{addr>=5 && addr<=60;}
//======================================================TOP MODULE======================================================================
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
           repeat(4) begin
           assert (r1.randomize());
           r1.dis1("Ram 1st");
           end

        end
endmodule
