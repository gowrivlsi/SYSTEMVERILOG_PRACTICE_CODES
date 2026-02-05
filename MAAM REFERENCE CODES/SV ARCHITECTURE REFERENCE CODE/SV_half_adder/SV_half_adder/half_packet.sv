//it is used to encapsulate all the signals based on the design
class half_packet;

   rand bit a,b;
        bit sum,carry;

        function void print(string name="");
          $display("name=%s",name);
          $display("a=%b",a);
          $display("b=%b",b);
          $display("sum=%b",sum);
          $display("carry=%b",carry);
        endfunction

endclass

   
