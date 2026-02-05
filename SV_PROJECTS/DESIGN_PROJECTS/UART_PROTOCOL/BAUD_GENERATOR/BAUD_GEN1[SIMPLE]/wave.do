onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /baud_tb/clk
add wave -noupdate -radix unsigned /baud_tb/rst
add wave -noupdate -radix unsigned /baud_tb/baud_tick
add wave -noupdate -radix unsigned /baud_tb/D/clk
add wave -noupdate -radix unsigned /baud_tb/D/rst
add wave -noupdate -radix unsigned /baud_tb/D/baud_tick
add wave -noupdate -radix unsigned /baud_tb/D/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {104181332 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {104118135 ps} {104220675 ps}
