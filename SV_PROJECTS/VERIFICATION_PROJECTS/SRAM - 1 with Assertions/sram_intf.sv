interface sram_intf(input clk,rst);
    
    logic [7:0] d_in;
    logic [2:0] addr;
    logic [7:0] d_out;
    logic wren;

    modport dut(input clk,rst,addr,d_in,wren, output d_out);
    modport tb(input clk,rst,d_out, output addr,d_in,wren);


    //clocking Block
        clocking clk1@(negedge clk);
            default  input #2 output #3;
                input d_out;
                output addr,d_in,wren;
        endclocking
endinterface
