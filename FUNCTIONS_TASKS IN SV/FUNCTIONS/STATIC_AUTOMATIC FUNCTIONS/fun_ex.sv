//===============================================STATIC_AUTOMATIC FUNCTIONS==============================================
module fun_ex;
    

    function void dis1();
                 int a;
       static    int b;
       automatic int c;
            a++;
            b++;
            c++;
            $display("a=%0d b=%0d c=%0d",a,b,c);
    endfunction


     function static void dis2();
                 int a;
       static    int b;
       automatic int c;
            a++;
            b++;
            c++;
            $display("a=%0d b=%0d c=%0d",a,b,c);
     endfunction

      function automatic void dis3();
                 int a;
       static    int b;
       automatic int c;
            a++;
            b++;
            c++;
            $display("a=%0d b=%0d c=%0d",a,b,c);
      endfunction

      initial begin
        repeat(6) begin
            dis1();
        end
        $display("===================END DISPLAY1=======================");
        #5;
        repeat(6) begin
            dis2();
        end
        $display("===================END DISPLAY2=======================");
        #5;
        repeat(6) begin
            dis3();
        end
        $display("===================END DISPLAY3=======================");
      end
endmodule
