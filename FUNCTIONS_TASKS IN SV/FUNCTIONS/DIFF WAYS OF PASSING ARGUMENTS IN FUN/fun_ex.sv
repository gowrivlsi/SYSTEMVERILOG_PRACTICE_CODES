//===========================================================DIFFERENT WAYS OF PASSING ARGUMENTS====================================================
module fun_ex;
    
    int i,x,y,j;
        //1]Argument Passing By Order
            function int order;
                //$display("==================By Order========================");
                input int a,b;
                return a + b;
            endfunction

        //2]Argument Passing By Name
            function int name;
                //$display("==================By Name========================");                
                input int a,b;
                output int y;
                y = a - b;
                $display("y=%0d a=%0d b=%0d",y,a,b);
            endfunction

       //3]Argument Passing By Value
            function int value(input int a,b);
                $display("==================By Value========================");                
                a = a + 2;//a=6
                return a + b;//6+8=14
            endfunction

       //4]Argument Passing By Reference
            function automatic int byref(ref int a,b);//By Passing ref function should be [automatic]
                $display("==================By Reference========================");                
                a = a + 25;
                return a / b;
            endfunction

       //5]Argument Passing By Constant Reference
            function automatic int byconstref;
                //$display("==================By Constent Reference========================");                
                const ref int a,b;
                return a * b;
            endfunction

       //6.A]Argument Passing By Default Argument
            function int by_deaf;
                //$display("==================A]By Default========================");                
                input int a=2,b=5;
                output int y;
                y = a ** b;
                $display("Power=%0d a=%0d b=%0d",y,a,b);
            endfunction

       //6.B]Argument Passing By Default Argument
            function int by_deaf1(input int a=5,b=10);
                $display("==================B]By Default========================");                
                return a + b;
            endfunction

       //6.C]Argument Passing By Default Argument              
            function int by_deaf2(input int a=5,b=10);
                $display("==================C]By Default========================");  
                by_deaf2 = a + b;
                $display("By_Deaf2=%0d a=%0d b=%0d",by_deaf2,a,b);
            endfunction

      //6.D]Argument Passing By Default Argument
            function int by_deaf3(input int a=5,b=10,output int y);
                $display("==================D]By Default========================");  
                y = a + b;
                $display("By_Deaf3=%0d a=%0d b=%0d",y,a,b);
            endfunction


       
       //Calling Functions
            initial begin
               i=order(4,5);
               $display("ADD=%0d",i);

               void'(name(.a(10),.b(5),.y(i)));
               $display("SUB=%0d",i);

               x=4;y=8;
               i=value(x,y);
               $display("ADD BY Value=%0d x=%0d y=%0d",i,x,y);
               
               x=5;y=6;
               j=byref(x,y);
               $display("DIV BY Ref=%0d x=%0d y=%0d",j,x,y);

               x=4;y=5;
               j=byconstref(x,y);
               $display("MUL BY ConstRef=%0d x=%0d y=%0d",j,x,y);

               void'(by_deaf(2,3,i));
               $display("Power=%0d",i);

              i=by_deaf1();
              $display("BY_DEAF1=%0d",i);

              i=by_deaf2(8,4);
              $display("BY_DEAF2=%0d",i);


             void'(by_deaf3(.y(i)));
              $display("BY_DEAF3=%0d",i);




            end
endmodule
