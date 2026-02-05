//====================================================RANDOMIZATION=======================================================
class full_add;
    
    rand bit a;
    randc bit [2:0]b;
    rand bit [1:0]c;
    bit sum,carry;

    //POST RANDOMIZE
    function void post_randomize();
        $display("Post Random");
        $display("a=%0d",a);
        $display("b=%0d",b);
        $display("c=%0d",c);
        $display("sum=%0d",sum);
        $display("carry=%0d",carry);

    endfunction

    function void dis(string n="");
        $display("Name=%0s",n);
        $display("a=%0d",a);
        $display("b=%0d",b);
        $display("c=%0d",c);
        $display("sum=%0d",sum);
        $display("carry=%0d",carry);
    endfunction

    //PRE RANDOMIZE
     function void pre_randomize();
        $display("PRE RANDOM");
        $display("a=%0d",a);
        $display("b=%0d",b);
        $display("c=%0d",c);
        $display("sum=%0d",sum);
        $display("carry=%0d",carry);

    endfunction

endclass


module top;
    
    full_add f1,f2;
    int s; int a,b;
    initial begin

        std :: randomize(a,b);
        $display("a=%0d b=%0d",a,b);
       
       f1=new;
            repeat(5) begin
             
             f1.randomize();
             f1.dis();
            
            //Enabling And Disabling The Radomize
            //f1.a.rand_mode(0);
            //f1.rand_mode();//if 1 for enableing the randomize 0 for disabling the randamize
           
            /*
            s=f1.randomize();
            $display("Randomize Pass=%0d",s);
            f1.dis("1st");
            
            if(!f1.randomize)//f1.randomize==0
                begin
                    $error("Failed");
                end
            else 
                $info("Pass"); 
           
           /*
            f1.b.rand_mode(0);
            void'(f1.randomize());
            f1.dis("2nd");

            assert(f1.randomize());
            f1.dis("3rd");*/
        end 
    end
endmodule
