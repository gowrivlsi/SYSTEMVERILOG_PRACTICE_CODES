//===================================================4BIT DECODER=======================================
module deco4b(
                input [1:0]d_i,
                output reg [3:0]d_o
             );

    always_comb
        
        begin
            if(~d_i[1] && ~d_i[0])
                begin
                    d_o[3]=0;d_o[2]=0;d_o[1]=0;d_o[0]=1;
                end
            if(~d_i[1] && d_i[0])
                begin
                    d_o[3]=0;d_o[2]=0;d_o[1]=1;d_o[0]=0;
                end
            if(d_i[1] && ~d_i[0])
                begin
                    d_o[3]=0;d_o[2]=1;d_o[1]=0;d_o[0]=0;
                end
            else if(d_i[1] && d_i[0])
                begin
                     d_o[3]=1;d_o[2]=0;d_o[1]=0;d_o[0]=0;
                end
 
        end
        

        /*
        begin
            case(d_i)
                2'b00 : d_o=4'b0001;
                2'b01 : d_o=4'b0010;
                2'b10 : d_o=4'b0100;
                2'b11 : d_o=4'b1000;
            endcase
        end
        */
endmodule
