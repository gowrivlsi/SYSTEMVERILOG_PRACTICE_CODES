//To Encapsulate the all signals of DUT

class half_pack;
      rand bit a,b;
           bit sum,carry;
           bit c,d;

            extern function void post_randomize();
            extern constraint c1;

           extern function void print(string n="");
endclass

    function void half_pack::print(string n ="");
            $display("Name : %0s",n);
            $display("a = %0d ",a);
            $display("b = %0d ",b);
            $display("sum = %0d ",sum);
            $display("carry = %0d ",carry);
    endfunction


    function void half_pack::post_randomize();
        c=a;
        d=b;
     endfunction

     constraint half_pack::c1{a!=c && b!=d;}
