vlog fifo_top.sv +acc
vsim -assertdebug fifo_top
add wave -r *
run -all
