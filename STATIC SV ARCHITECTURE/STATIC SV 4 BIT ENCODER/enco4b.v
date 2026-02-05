//==========================================ENCODER DESIGN========================
module enco4b(enco4b_intf E);
    always@(*)
        begin
             if(E.e_i[0] && ~E.e_i[1] && ~E.e_i[2] && ~E.e_i[3])
                begin
                    E.e_y[0]=0;E.e_y[1]=0;
                end
             else if(~E.e_i[0] && E.e_i[1] && ~E.e_i[2] && ~E.e_i[3])
                begin
                    E.e_y[0]=0;E.e_y[1]=1;
                end
             else if(~E.e_i[0] && ~E.e_i[1] && E.e_i[2] && ~E.e_i[3])
                begin
                    E.e_y[0]=1;E.e_y[1]=0;
                end
             else
                 begin
                    E.e_y[0]=1; E.e_y[1]=1;
                 end
        end
endmodule

