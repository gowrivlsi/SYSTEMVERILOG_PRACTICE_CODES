//=========================================================ASENDING_DESENDING OF AN ARRAY===========================================
module array_sort;

    int d[] = '{18,41,58,5,12,13};//size=6

    initial begin : Block_1//FOR ASENDING USING WHILE LOOP
        int i = 0;
        int temp;

        while (i < d.size() - 1) begin//6-1=5 while(i<5)
            if (d[i] > d[i+1]) begin
                // swap
                temp   = d[i];
                d[i]   = d[i+1];
                d[i+1] = temp;

                // start from begining
                i = 0;
            end else begin
                i++;   // move forward
            end
        end

        $display("Sorted Array = %p", d);
    end


    initial begin : Block_2//FOR DESENDING USING DO WHILE LOOP
        int j=0;
        int temp;

            do begin
                    if(d[j+1] > d[j]) begin
                        //Swap
                        temp = d[j];
                        d[j] = d[j+1];
                        d[j+1] = temp;

                        j=0;
                        end else begin
                            j++;
                        end

               end
          while(j < d.size()-1);

        $display("Sorted Array = %p", d);

    end

endmodule

