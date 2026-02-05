vlog +cover dff_top.sv +acc
vsim -coverage top
add wave -r *
run -all
