onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /router_test_top/top_io/clock
add wave -noupdate /router_test_top/top_io/reset_n
add wave -noupdate {/router_test_top/top_io/cb/valid_n[3]}
add wave -noupdate {/router_test_top/top_io/cb/frame_n[3]}
add wave -noupdate {/router_test_top/top_io/cb/din[3]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4149400 ps} 0}
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
WaveRestoreZoom {0 ps} {4357500 ps}
