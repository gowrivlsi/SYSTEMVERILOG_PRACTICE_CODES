//===============================================CLASS GENERATOR PACKET=================================
`include"class_trans.sv"
class genrator;
   trans t1;
   int f;

   task gen();
        //$display("=================GENARATOR CLASS==============");
        repeat(f)begin
        assert(t1.randomize());
       t1.sig("From Genrator Half_Adder Singls t1");#10;
       end
        
   endtask

   //Custom new Constructor
   
   function new(trans t1,int f);
        this.f=f;
        this.t1=t1;
    endfunction 
endclass 
