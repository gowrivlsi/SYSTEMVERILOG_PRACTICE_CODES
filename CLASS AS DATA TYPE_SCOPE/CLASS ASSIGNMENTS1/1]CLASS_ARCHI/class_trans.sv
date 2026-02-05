//====================================================Class Transaction Packet=============================================
class trans;
    rand byte a;
    rand byte b;
    bit sum;
    bit carry;

   extern function void sig(string n="");

   

endclass

function void trans::sig(string n="");
        $display("Name=%0s",n);
        $display("a=%0d",a);
        $display("b=%0d",b);
       // $display("sum=%0d",sum);
        //$display("carry=%0d",carry);
endfunction
