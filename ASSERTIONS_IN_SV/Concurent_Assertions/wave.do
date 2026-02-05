onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP -radix unsigned /top/clk
add wave -noupdate -expand -group TOP -radix unsigned /top/rst
add wave -noupdate -expand -group INPUTS -radix unsigned /top/T/clk
add wave -noupdate -expand -group INPUTS -radix unsigned /top/T/rst
add wave -noupdate -expand -group INPUTS -radix unsigned /top/T/a
add wave -noupdate -expand -group INPUTS -radix unsigned /top/T/b
add wave -noupdate -expand -group INPUTS -radix binary /top/T/c
add wave -noupdate -radix unsigned /top/T/A
add wave -noupdate -radix unsigned /top/T/B
add wave -noupdate -radix unsigned /top/T/C
add wave -noupdate -radix unsigned /top/T/D
add wave -noupdate -radix unsigned /top/T/E
add wave -noupdate -radix unsigned /top/T/F
add wave -noupdate -radix unsigned /top/T/G
add wave -noupdate -radix unsigned /top/T/H
add wave -noupdate -radix unsigned /top/T/I
add wave -noupdate -radix unsigned /top/T/J
add wave -noupdate -radix unsigned /top/T/K
add wave -noupdate -radix unsigned /top/T/L
add wave -noupdate -radix unsigned /top/T/M
add wave -noupdate -radix unsigned /top/T/N
add wave -noupdate -radix unsigned /top/T/O
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
