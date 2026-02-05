//===========================================ALL TYPES OF ARRAYS========================================================
module array_ex();
    //Declaring Fixed/Static Array 
        int a[8];

    //Declaring Dynamic Array
        byte b[];

    //Declaraing Associate array
        bit[31:0]c[*];//bit[31:0] c[int]
        int e[string];
        int i;// refence for first(),last(),next(),prev();
        string j;//reference for  first(),last(),next(),prev();

    //Declaring Queue Array
        int d[$];
        int f=0;

    //Initialization of Fixed Array
        initial begin :Block_1
        disable Block_1;
            $display("==============Fixed Array============");
            $display("F_array = %p",a);
        //1.Direct Initialization
            a = '{10,15,20,25,30,35,40,45};//casting Operator (')
            $display("F_array of Direct Inti=%p",a);            
        //2.Initialization with indices
            a[0]=20;
            a[1]=25;
            a[2]=30;
            a[3]=35;
            a[4]=40;
            a[5]=45;
            a[6]=50;
            a[7]=55;
            $display("F_array of Initial By Indices=%p",a);            
        //3.Initialization with loops

            foreach(a[i]) begin
                a[i] = $urandom_range(60,150);
            $display("F_array Of Using foreach Loop[%0d] = %0d",i,a[i]);                
            end
            $display("F_array of wit Foreach loop = %p",a);            
        end

    //Initialization of Dynamic Array
        initial begin : Block_2
        disable Block_2;
             $display("==============Dynamic Array============");
                b=new[10];
            $display("D_array = %p",b);
        //1.Direct Initialization
            b='{14,10,25,24,32,24,25,24,21,55};
             $display("D_array of Direct Inti=%p",b);
       //2.Initialization with indices
            a[0]=20;
            a[1]=25;
            a[2]=30;
            a[3]=35;
            a[4]=40;
            a[5]=45;
            a[6]=50;
            a[7]=60;
            a[8]=65;
            a[9]=75;
            $display("D_array of Initial By Indices=%p",a);  
       //3.Initialization with loops
           for (int i=0;i<$size(b);i++)
               begin
                    d[i]=$random;
                    $display("D_arry of Using For loop[%0d] =%0d",i,b[i]);
               end
                 $display("D_array of wit Foreach loop = %p",b); 

                $display("D_array of Size  = %0d",b.size);
                b=new[15](b);//copying the before values
                      $display("D_array of Expand Location = %p",b); 
                b=new[15];
                 $display("D_array of Expand Location = %p",b);
                    b.delete();
                 $display("D_array of Delete  = %p",b); 
        end
     
      //Initialization of Associative Array
        initial begin : Block_3
        disable Block_3;
            $display("==============Associative Array============");
         //1.Direct Initialization
            c='{5:10,45:15,43:20,10:25,15:30,12:35,17:40,18:45};
            $display("A_array of Direct Inti=%p",c);
         //2.Initialization with indices
            c[10]=25;
            c[25]=35;
            c[24]=54;
            c[27]=28;
            c[41]=41;
            c[78]=74;
            c[87]=14;
             $display("A_array of Initial By Indices=%p",c); 
         //3.Initialization with loops
           /* while (i<18) begin
                    c[i]=$random;
                    $display("D_arry of Using While loop[%0d] =%0d",i,c[i]);
                end*/

            // $display("D_array of with While loop = %p",c);

            //Built In Methid
                 $display("A_array of Size  = %0d",c.size);//size()/num()
                 c.first(i);
                 $display("A_array of First  = %0d",i);
                 c.last(i);
                 $display("A_array of Last  = %0d",i); 
                
                 c.next(i);
                 $display("A_array of Next  = %0d",i);
                 c.prev(i);
                 $display("A_array of Prev  = %0d",i);
                 c.delete(i);
                 $display("A_array of Last  = %0d",i);

                 $display("A_array of Exists  = %0d",c.exists(10));//If INdex Value is there = 1(True) oterwise (0)flase
                 
        end

        //Associative For String Data type
            initial begin : Block_4
            disable Block_4;
            //2.Initialization with indices
            e["A"]=25;
            e["B"]=35;
            e["C"]=54;
            e["D"]=28;
            e["E"]=41;
            e["F"]=74;
            e["G"]=14;
             $display("A_array of Initial By Indices=%p",e); 
             void'(e.first(j));
                 $display("A_array of First  = %s",j);

             void'(e.last(j));
                 $display("A_array of Last  = %s",j);

             void'(e.next(j));
                 $display("A_array of Next  = %s",j);

             void'(e.prev(j));
                 $display("A_array of Prev  = %s",j);

             void'(e.next(j));
                 $display("A_array of next  = %s",j);
                   
                 $display("A_array of Size  = %d",e.size);

             void'(e.delete(i));
                 $display("A_array of delete  = %p",i);

            end
        
          //Initialization of Fixed Array
        
            initial begin : Block_5
              $display("==============Queue Array============");
              $display("Q_array = %p",d);

               //1.Direct Initialization
                    d='{10,52,54,84,25,24};
                    $display("Q_array of Direct Inti=%p",d);

               //3.Initialization with loops
                    while(f < 10) begin
                            d[f]=$urandom_range(20,60);//{d,f};
                            $display("Q_arry of Using While loop[%0d] =%0d",f,d[f]);
                             f++;

                    end//Built in Methods In queues
                     $display("Queue Contents = %p", d);//'{46, 41, 26, 30, 50, 32, 33, 36, 36, 25}
                     $display("Q_array of Size  = %0d",d.size);//10

                     d.delete(4);
                     $display("Q_array of Delete 4 index  = %p",d);// '{46, 41, 26, 30, 32, 33, 36, 36, 25}

                     d.insert(5,30);
                     $display("Q_array of insert 30 at 5 index:%p",d);

                     d.push_front(45);
                     $display("Q_array of Push front value of 45:%p",d);

                     d.push_back(35);
                     $display("Q_array of Push Back value of 35:%p",d);
                     
                      $display("Q_array of Pop front value of :%p",d.pop_front);
                      $display("Q_array of Push front value of :%p",d.pop_back);


                     //Operators in Queues
                        $display("=============================Operators in QUEUES===========================");
                        $display("Queue Contents = %p", d);
                        d=d[1:$];//It Removes 0th index element
                        $display("Queue Contents 0 index value removed = %p", d);
                        
                        $display("Queue Contents = %p", d);
                        d=d[0:$-1];//It Removes last index value
                        $display("Queue Contents last index value removed = %p", d);

                        $display("Queue Contents = %p", d);
                        d=d[1:$-1];//It removes 1st last
                        $display("Queue Contents 1st & last index value removed = %p", d);
                        
                        $display("Queue Contents = %p", d);
                        d={d[0:4],38,d[5:$]};//pos=5 It insrt the value 38 at 5th index Exact Position
                        $display("Queue Contents After insrting 38 at 5 index = %p", d);

                        $display("Queue Contents = %p", d);
                        d={d[0:3],48,d[4:$]};//pos=5 It insrt the value 48 at (before)4th index Exact Position
                        $display("Queue Contents Before(4th) insrting 48 at 5 index = %p", d);
                        
                        $display("Queue Contents = %p", d);
                        d={d[0:5],58,d[4:$]};//pos=5 It insrt the value 58 at (after)6th index Exact Position
                        $display("Queue Contents Before(6th) insrting 58 at 5 index = %p", d);

                        $display("Queue Contents = %p", d);
                        d={52,d};//insert the vale at first 52
                        $display("Queue Contents 52 at 0th index with conti of d = %p", d);

                        $display("Queue Contents = %p", d);
                        d={d,43};//insert the vale at last 43
                        $display("Queue Contents 43 at $(last) index with conti of d = %p", d);

                        $display("Queue Contents = %p", d);
                        d={};
                        $display("Queue Contents Deleted All=%p",d);

                         d='{10,52,54,84,25,24};
                        $display("Q_array of Direct Inti=%p",d);
            end

endmodule
