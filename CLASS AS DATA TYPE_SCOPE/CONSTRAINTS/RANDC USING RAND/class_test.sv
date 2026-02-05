//=============================================FUNCTIONALITY OF RANDC USING RAND========================================================
class pack;
    
    rand bit[4:0] a;

    extern function void dis(string n="");
    
    extern constraint c1;
endclass

function void pack::dis(string n="");
    $display("Name=%0s",n);
    $display("A=%0d",a);
endfunction

constraint pack::c1{a inside{1,2,3,4,5};}


module top;
    
    pack p1;
        
        initial begin
            p1=new;

            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Randc Function Using Rand");
            end
        end
endmodule
