module test;
    int a[10];
        function automatic void gen(output int arr[10]);
            int high = 9;
            int low = 0;

            for(int i=0; i<10; i++) begin
                    if(i%2 == 0) begin
                            arr[i] = high;
                            high--;
                        end
                    else
                        begin
                            arr[i] = low;
                            low++;
                        end
                end
        endfunction


        initial begin
            gen(a);
            $display("Sequence Generator = %p",a);
        end
endmodule
