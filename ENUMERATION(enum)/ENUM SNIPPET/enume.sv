//================================================ENUMERATION SNIPPET CODE=================================================
module enume();
    enum {a,b,c,d,e}G;//without assigning any values to the elements
           //SNIPPET 1
        initial begin :Block_1
        disable Block_1; 
            $display("===============ENUMERATION [enum] VALUES AND NAMES==============");
            $display("NUMBER OF ELEMENTS VALUE = %0d",G.num);//5
            $display("NUMBER OF ELEMENTS NAME= %0d",G.name);//a
            $display("NUMBER OF ELEMENTS FIRST= %0d %0s",G.first,G);//0=a
            $display("NUMBER OF ELEMENTS LAST = %0d %0s",G.last,G.last);//4=e
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",G.next,G.next);//1=b
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",G.next(2),G.next(2));//2=c
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",G.next(3),G.next(3));//3=d
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",G.prev(3),G.prev(3));//2=c
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",G.prev,G.prev);//4=e
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",G.prev(4),G.prev(4));//1=b
            G=d;
            $display("NUMBER OF ELEMENTS NAME = %0d",G.name);//IT Will display the which pointer is there 
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",G.prev(3),G.prev(3));//0=a
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",G.prev(2),G.prev(2));//1=b//it depends on where the pointer is located from that we want to count
            
        end

    //SNIPPET 2
         typedef enum {f,g,h,i,j}M;//USING TYPEDEF 
        M M1,M2;
        
        initial begin : Block_2
        disable Block_2;
            $info("===========================ENUMERATION [enum] USING TYPEDEF=====================");
            M1=g;
            $display("====Dispaly Pointer= %0s",M1.name);
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",M1.next(2),M1.next(2));//3=i
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",M1.next(3),M1.next(3));//4=j
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",M1.prev(3),M1.prev(3));//3=i

            M2=i;
            $display("====Dispaly Pointer= %0s",M2.name);//3=i
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",M2.next(2),M2.next(2));//0=f
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",M2.next(3),M2.next(3));//1=g
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",M2.prev(3),M2.prev(3));//0=f
        end

     //SNIPPET 3
        typedef enum {colors[5]}A;
        A A1,A2;

        initial begin : Block_3
             $info("===========================ENUMERATION [enum] USING TYPEDEF=====================");
           // A1=colors[1];
            $display("====Dispaly Pointer= %0s",A1.name);
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",A1.next(2),A1.next(2));//
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",A1.next(3),A1.next(3));//
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",A1.prev(3),A1.prev(3));//

            //A2=colors[3];
            $display("====Dispaly Pointer= %0s",A2.name);//
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",A2.next(2),A2.next(2));//
            $display("NUMBER OF ELEMENTS NEXT = %0d %0s",A2.next(3),A2.next(3));//
            $display("NUMBER OF ELEMENTS PREVIOUS = %0d %0s",A2.prev(3),A2.prev(3));//

        end
endmodule
