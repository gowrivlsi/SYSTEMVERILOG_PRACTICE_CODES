//=====================================================4BIT ENCODER============================================
module enco4b(
                input [3:0]y,
                output reg [1:0]i
             );

    
    always_comb
        begin
            if(~y[3] && ~y[2] && ~y[1] && y[0])
                begin
                    i[1]=0; i[0]=0;
                end
            if(~y[3] && ~y[2] && y[1] && ~y[0])
                begin
                    i[1]=0; i[0]=1;
                end
            if(~y[3] && y[2] && ~y[1] && ~y[0])
                begin
                    i[1]=1; i[0]=0;
                end

             else if(y[3] && ~y[2] && ~y[1] && ~y[0])
                begin 
                   i[1]=1; i[0]=1;
                end 
     
        end 
    
    /*
        always_comb
        begin
            case(y)
                4'b0001 : i=2'b00;
                4'b0010 : i=2'b01;
                4'b0100 : i=2'b10;
                4'b1000 : i=2'b11;
            endcase
        end
        */

endmodule
