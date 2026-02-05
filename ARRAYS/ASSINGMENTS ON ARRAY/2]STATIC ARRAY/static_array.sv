//=============================================STASTIC ARRAY 10 BIT [EVEN NUMBERS]=============================================
module static_array;
    int a[0:9];//declaration of fixed array
    int odd=1;//foreach loop
    int j=0;//while and do while loop
    initial begin : Bloclk_1
        $display("==========Filling ODD NUMBERS USING FOR LOOP============");
        for(int i=0;i<10;i++) 
        begin
            a[i]=2*i+1;//Formula for odd numbers
        end
         $display("Filling With ODD Numbers=%p",a);

        $display("==========Filling ODD NUMBERS USING FOREACH LOOP============");
        foreach(a[i]) begin 
        a[i]=odd;
        odd+=2;  //next odd number
        end
        $display("Filling With ODD Numbers=%p",a);

        $display("==========Filling ODD NUMBERS USING WHILE LOOP============");
        while (j<10) begin
                a[j]=2*j+1;
                j++;
        end
        $display("Filling With ODD Numbers=%p",a);
        
        $display("==========Filling ODD NUMBERS USING DO WHILE LOOP============");
        do begin
               a[j]=2*j+1;
               j++;
            end
        while(j < 10);
        $display("Filling With ODD Numbers=%p",a);

    end
    
endmodule
