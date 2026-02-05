//========================================INTERFACE DESIGN=================================================
interface alu_intf #(parameter w=8)();
    logic [w-1:0]a,b;
    logic [$clog2(w):0]opc;
    logic [w-1:0]y;
endinterface
