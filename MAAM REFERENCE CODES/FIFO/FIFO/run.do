vlog top.sv +acc
vsim -assertdebug top
add wave -r *
add wave /top/DUT/a/a1  /top/DUT/a/a2
run -all
