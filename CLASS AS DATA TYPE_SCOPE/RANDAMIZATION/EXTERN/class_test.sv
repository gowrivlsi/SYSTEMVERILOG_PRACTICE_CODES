class full_add;
    
    rand bit a;
    randc bit [2:0]b;
    rand bit [1:0]c;
    bit sum,carry;

    //POST RANDOMIZE
    extern function void post_randomize();
        

   extern function void dis(string n="");
       
    //PRE RANDOMIZE
    extern function void pre_randomize();
        
endclass

//===============================================USING EXTERN KEYWORD==============================================

     function void full_add::post_randomize();
        $display("Post Random");
        $display("a=%0d",a);
        $display("b=%0d",b);
        $display("c=%0d",c);
        $display("sum=%0d",sum);
        $display("carry=%0d",carry);

    endfunction

    function void full_add::dis(string n="");
        $display("Name=%0s",n);
        $display("a=%0d",a);
        $display("b=%0d",b);
        $display("c=%0d",c);
        $display("sum=%0d",sum);
        $display("carry=%0d",carry);
    endfunction

    //PRE RANDOMIZE
     function void full_add::pre_randomize();
        $display("PRE RANDOM");
        $display("a=%0d",a);
        $display("b=%0d",b);
        $display("c=%0d",c);
        $display("sum=%0d",sum);
        $display("carry=%0d",carry);

    endfunction

//===============================================TOP MODULE====================================================
module top;
    
    full_add f1,f2;
    int s;

    initial begin
         f1=new;
            repeat(5) begin
             
           s=f1.randomize();
             f1.dis();
            
          end 
    end
endmodule
