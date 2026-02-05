//===============================================TRAFFIC LIGHT CONTROLLER=================================
module tlc(input clk,rst,output string Lights );
   typedef enum {Red,Yellow,Green} L;
   L cs,ns;

    int count;
    
    
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                cs<=Red;
                count<=0;
            end
        else begin
                cs<=ns;
                if(ns == Red && cs == Green)
                    count <= 0;
                else
                    count <= count + 1;
             end
    end

    always @(*) begin
       case(cs)
            Red : begin
                    if(count==60)
                        begin
                            ns=Yellow;
                            Lights="YELLOW";
                        end
                    else begin
                            ns=Red;
                            Lights="RED";
                         end
                  end
             Yellow : begin
                        if(count==120)
                            begin
                                ns=Green;
                                Lights="GREEN";
                            end
                        else begin
                                ns=Yellow;
                                Lights="YELLOW";
                             end
                      end
             Green : begin
                        if(count==180)
                            begin
                                ns=Red;
                                Lights="RED";
                            end
                        else begin
                                ns=Green;
                                Lights="GREEN";
                             end
                     end
       endcase
    end
endmodule
