vlog +cover enco_top.sv +acc
vsim -coverage top
add wave -r *
run -all
