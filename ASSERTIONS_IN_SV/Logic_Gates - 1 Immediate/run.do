vlog logic_top.sv +acc
vsim -assertdebug top
do wave.do
#add wave -r *
add wave /top/T/NOT1 /top/T/AND1 /top/T/OR1 /top/T/NAND1 /top/T/NOR1 /top/T/XOR1 /top/T/XNOR1
run -all
