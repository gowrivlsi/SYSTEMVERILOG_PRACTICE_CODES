//===============================================CLASS GENERATOR PACKET=================================
`include"class_trans.sv"
class genrator;
   trans t1;
   int i;

   function new(int i);
    this.i=i;
     t1=new;
   endfunction

   task gen();
       repeat(i)begin
           assert(t1.randomize());
            t1.sig("From Genrator Half_Adder Singls t1");
            #10;
       end
   endtask

   
endclass 
