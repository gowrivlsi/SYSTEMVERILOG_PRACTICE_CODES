onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -radix unsigned /top/clk
add wave -noupdate -expand -group TOP -radix unsigned /top/rst
add wave -noupdate -expand -group INTF -radix unsigned /top/I/clk
add wave -noupdate -expand -group INTF -radix unsigned /top/I/rst
add wave -noupdate -expand -group INTF -radix unsigned /top/I/a
add wave -noupdate -expand -group INTF -radix unsigned /top/I/b
add wave -noupdate -expand -group INTF -radix unsigned /top/I/not1
add wave -noupdate -expand -group INTF -radix unsigned /top/I/and1
add wave -noupdate -expand -group INTF -radix unsigned /top/I/or1
add wave -noupdate -expand -group INTF -radix unsigned /top/I/xor1
add wave -noupdate -expand -group DUT -radix unsigned /top/D/clk
add wave -noupdate -expand -group DUT -radix unsigned /top/D/rst
add wave -noupdate -expand -group DUT -radix unsigned /top/D/a
add wave -noupdate -expand -group DUT -radix unsigned /top/D/b
add wave -noupdate -expand -group DUT -radix unsigned /top/D/not1
add wave -noupdate -expand -group DUT -radix unsigned /top/D/and1
add wave -noupdate -expand -group DUT -radix unsigned /top/D/or1
add wave -noupdate -expand -group DUT -radix unsigned /top/D/xor1
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/clk
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/rst
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/a
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/b
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/not1
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/and1
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/or1
add wave -noupdate -expand -group TB -radix unsigned /top/T/I/xor1
add wave -noupdate -expand -group ASSERTIONS -radix unsigned /top/T/NOT
add wave -noupdate -expand -group ASSERTIONS -radix unsigned /top/T/AND
add wave -noupdate -expand -group ASSERTIONS -radix unsigned /top/T/OR
add wave -noupdate -expand -group ASSERTIONS -radix unsigned /top/T/XOR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10 ns} 0}
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
WaveRestoreZoom {0 ns} {105 ns}
