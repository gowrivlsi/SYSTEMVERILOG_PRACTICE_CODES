//=========================================================ARRAY SORTING USING WHILE LOOP===========================================
module array_sort;

    int d[] = '{12, 5, 7, 1, 20, 3};//size=6

    initial begin
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

endmodule
