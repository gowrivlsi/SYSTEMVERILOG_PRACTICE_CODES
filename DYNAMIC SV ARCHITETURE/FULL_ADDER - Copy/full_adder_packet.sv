class full_adder_pack;
    rand bit a,b,cin;
         bit sum,carry;

         int c,d,e;

         extern function void print(string n = "");

         extern function void post_randomize();

         extern constraint c1;

endclass

function void full_adder_pack::print(string n = "");
        $display("NAME : %0s",n);
        $display("FA_INPUTS  : a = %0d | b = %0d | cin =%0d",a,b,cin);
        $display("FA_OUTPUTS : Sum = %0d | Carry = %0d",sum,carry);
endfunction

function void full_adder_pack::post_randomize();
    c = a;
    d = b;
    e = cin;
endfunction

constraint full_adder_pack::c1{a != c || b != d || cin != e ;}
