vlog logic_top.sv +acc
vsim -assertdebug top
do wave.do
#add wave -r *
#add wave /top/T/NOT /top/T/AND /top/T/OR /top/T/XOR
run -all
