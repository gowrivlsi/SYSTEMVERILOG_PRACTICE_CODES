vlog top.sv +acc
vsim -assertdebug top
#do wave.do
add wave -r *
add wave /top/T/A /top/T/B /top/T/C /top/T/D /top/T/E /top/T/F /top/T/G /top/T/H /top/T/I /top/T/J /top/T/K /top/T/L /top/T/M /top/T/N /top/T/O /top/T/P /top/T/Q /top/T/R
run -all
