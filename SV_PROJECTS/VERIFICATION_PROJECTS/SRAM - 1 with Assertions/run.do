vlog  sram_top.sv +acc
vsim -assertdebug top
#do wave.do
add wave -r *
run -all
