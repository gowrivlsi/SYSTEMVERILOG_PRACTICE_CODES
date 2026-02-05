/*
class test;
    rand int a[18];

        constraint c1{foreach(a[i]){
                        if(i < 5)
                            a[i] == 0;
                        else if((i - 5)%3==0)
                            a[i] == (((i - 5)/3) +1);
                        else 
                            a[i] == 0;
                            }
                     }
endclass

module top;
    test t1;

        initial begin
           t1 = new;
           assert(t1.randomize());
           $display("a=%p",t1.a);
        end
endmodule
*/


class seq_gen;
    rand int dummy;          // just to trigger randomize
    int q[$];                // queue to store sequence

    constraint c_dummy {
        dummy == 0;
    }

    function void post_randomize();
        q.delete();

        // First five zeros
        repeat (5)
            q.push_back(0);

        // Generate 1 to 5 pattern
        for (int i = 1; i <= 5; i++) begin
            q.push_back(i);
            q.push_back(0);
            q.push_back(0);
        end
    endfunction
endclass


module test;
    initial begin
        seq_gen s = new();
        assert(s.randomize());
        $display("%p", s.q);
    end
endmodule

