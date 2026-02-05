/*
class pack;
    rand byte unsigned a[6];

    function void dis(string n="");
        $display("Name : %0s",n);
        $display("a=%p",a);
    endfunction
    
    constraint c1{a[0]==0;a[1]==1;
                
                foreach(a[i]){
                    if(i>=2)
                        a[i]==a[i-1] + a[i+1];
                           }
                }
endclass
*/

class pack;
    rand byte unsigned a[6];

    function void dis(string n="");
        $display("Name : %0s", n);
        $display("a = %p", a);
    endfunction

   /*
   constraint c1 {  
        foreach (a[i]) 
            if(i==0)
                a[i] inside{[0:5]};
            else if(i==1)
                    a[i] inside{[0:10]};
                else 
                    a[i] == a[i-1] + a[i-2];
            
    }
    */
    constraint c1{
                a[0] inside{[5:10]};
                a[1] inside{[0:10]};
                a[2]==a[0]+a[1];
                a[3]==a[2]+a[1];
                a[4]==a[3]+a[2];
                a[5]==a[4]+a[3];
        }
endclass





module top;
    pack p1;
        initial begin
            p1=new;
            repeat(8)begin
                assert(p1.randomize());
                p1.dis("Duble of pervious one -> Fibonacci");
            end
        end
endmodule

