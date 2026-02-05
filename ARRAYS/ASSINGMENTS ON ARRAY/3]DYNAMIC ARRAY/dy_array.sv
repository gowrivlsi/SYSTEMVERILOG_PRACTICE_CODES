//============================================DYNAMIC ARRAY 10 BIT FILLING EVEN NUMBERS=================================
module dy_array;
    int d[];//Declaration of D_array
    bit dy[];//Declaration od D_arry [for storing 0's and 1's]
    int val=10,even=0;//foreach loop and do while  
    bit toggle=1;//foreach loop,while and do while loop 
    int j=0;//while loop and do while loop

//=================================================================
//Storing Even Numbers Block_1
    initial begin : Block_1
    //disable Block_1;
        $display("========================D_ARRAY FILLING WITH EVEN NUMBERS================================");
        d=new[10];//10 bit memory location
        $display("D_array Contents=%p",d);
        $display("========================D_ARRAY FILLING WITH EVEN NUMBERS USING FOR LOOP================================");
        for(int i=0;i<10;i++) 
                d[i]=2*i;//Formula for even numbers (for odd 2*i+1)
                $display("Dynamic Array with Even Numbers = %p", d);
        $display("========================D_ARRAY FILLING WITH EVEN NUMBERS USING FOREACH LOOP================================");
        foreach(d[i]) begin
            d[i]=even;
            even+=2;//increment by 2 each
        end
           $display("Dynamic Array with Even Numbers = %p", d);

        $display("========================D_ARRAY FILLING WITH EVEN NUMBERS USING WHILE LOOP================================");
        while(j < 10) begin
            d[j]=2*j;
            j++;
        end
           $display("Dynamic Array with Even Numbers = %p", d);
           $display("========================D_ARRAY FILLING WITH EVEN NUMBERS USING DO WHILE LOOP================================");
           do begin
                d[j]=even;
                even+=2;
                j++;
              end
           while(j < 10);
           $display("Dynamic Array with Even Numbers = %p", d);
  end

//===============================================================
//FOr Storing 0's and 1's Block_2
    initial begin : Block_2
    //disable Block_2;
        $display("========================D_ARRAY FILLING WITH 1's and 0's ================================");
        dy=new[10];
        $display("D_array Contents=%p",dy);
        $display("========================D_ARRAY FILLING WITH 1'S AND 0'S USING FOR LOOP================================");
        for(int i=0;i<10;i++) 
            begin
                dy[i]=(i%2==0)?1:0;//if remender=0 [even=1/odd=0] 
            end
        $display("Filling With 1's and 0's=%p",dy);
        $display("========================D_ARRAY FILLING WITH 1'S AND 0'S USING FOREACH LOOP================================");
        foreach(dy[i]) begin
            dy[i]=toggle;
            toggle=~toggle;
        end
        $display("Filling With 1's and 0's=%p",dy);
        $display("========================D_ARRAY FILLING WITH 1'S AND 0'S USING WHILE LOOP================================");
        while(j < 10) begin
            dy[j]=toggle;
            toggle=~toggle;
            j++;
        end
        $display("Filling With 1's and 0's=%p",dy);
        $display("========================D_ARRAY FILLING WITH 1'S AND 0'S USING DO WHILE LOOP================================");
        do begin
                dy[j]=toggle;
                toggle=~toggle;
                j++;
           end
       while(j < 10);
        $display("Filling With 1's and 0's=%p",dy);
 end


//================================================================
//Storing 10,20,... IN Dynamic Array Block_3
    initial begin : Block_3
    //disable Block_3;
        $display("========================D_ARRAY FILLING WITH 10 to 100================================");
        d=new[10];
        $display("D_array Contents=%p",d);
        $display("========================D_ARRAY FILLING WITH 10 to 100 USING FOR LOOP================================");
        for(int i=0;i<10;i++) 
            begin
                d[i]=(i+1)*10;//using *(multiply)operator
            end
            $display("Filling With 10 to 100=%p",d);
        $display("========================D_ARRAY FILLING WITH 10 to 100 USING FOREACH LOOP================================");
        foreach(d[i]) begin
            d[i]=(i+1)*10;
        end
            $display("Filling With 10 to 100=%p",d);
        $display("========================D_ARRAY FILLING WITH 10 to 100 USING WHILE LOOP================================");
        while(j<10) begin
            d[j]=val;//Without using *
            val+=10;
        end
            $display("Filling With 10 to 100=%p",d);
        $display("========================D_ARRAY FILLING WITH 10 to 100 USING DO WHILE LOOP================================");
        do begin
            d[j]=val;
            val+=10;
            j++;
           end
        while(j < 10);
            $display("Filling With 10 to 100=%p",d);
 end
endmodule
