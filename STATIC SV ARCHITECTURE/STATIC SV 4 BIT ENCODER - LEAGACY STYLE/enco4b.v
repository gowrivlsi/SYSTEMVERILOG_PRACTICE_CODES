//==========================================ENCODER DESIGN========================
module enco4b(input [0:3]i,
              output reg [0:1]y  
             );
    always@(*)
        begin
             if(i[0] && ~i[1] && ~i[2] && ~i[3])
                begin
                    y[0]=0;y[1]=0;
                end
             else if(~i[0] && i[1] && ~i[2] && ~i[3])
                begin
                    y[0]=0;y[1]=1;
                end
             else if(~i[0] && ~i[1] && i[2] && ~i[3])
                begin
                    y[0]=1;y[1]=0;
                end
             else
                 begin
                    y[0]=1; y[1]=1;
                 end
        end
endmodule

