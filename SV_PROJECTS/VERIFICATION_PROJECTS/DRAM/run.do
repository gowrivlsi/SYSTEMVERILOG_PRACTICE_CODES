vlog +cover dram_top.sv +acc
vsim -coverage top
do wave.do
#add wave -r *
run -all
