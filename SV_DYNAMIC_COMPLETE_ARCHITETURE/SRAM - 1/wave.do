onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -radix unsigned /top/clk
add wave -noupdate -expand -group TOP -radix unsigned /top/rst
add wave -noupdate -expand -group INTF -radix unsigned /top/I/clk
add wave -noupdate -expand -group INTF -radix unsigned /top/I/rst
add wave -noupdate -expand -group INTF -radix unsigned /top/I/wren
add wave -noupdate -expand -group INTF -radix unsigned /top/I/d_in
add wave -noupdate -expand -group INTF -radix unsigned /top/I/addr
add wave -noupdate -expand -group INTF -radix unsigned /top/I/d_out
add wave -noupdate -expand -group DUT -radix unsigned /top/D/clk
add wave -noupdate -expand -group DUT -radix unsigned /top/D/rst
add wave -noupdate -expand -group DUT -radix unsigned /top/D/wren
add wave -noupdate -expand -group DUT -radix unsigned /top/D/addr
add wave -noupdate -expand -group DUT -radix unsigned /top/D/d_in
add wave -noupdate -expand -group DUT -radix unsigned /top/D/d_out
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/clk
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/rst
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/wren
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/d_in
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/addr
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/d_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35 ns} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {1 ns} {195 ns}
