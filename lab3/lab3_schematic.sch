WindowType FullviewSchematic /router_test_top
DesignChecksum {5FUM;[ONfg[lIOFW7>G8:0}
RoutedNets {}
RoutedInst {}
WindowPreferences {showhierarchy 1 showacttime 1 inoutlocation 1 selequivnets 0 hidebuffers 0 hidecells 1 hideinverters 0 selectenv 1 autowave 1 lognets 1 popupenabled 1 mouseoverenabled 1 showdunames 0 showinstnames 1 shownetnames 0 shownetnamestyle corner shownetstate 0 showpinnames 1 showripindices 1 showvalues 1 verticaltext 1 netxFollowsControlLogic 0 netxMaxGates 1024 netxMaxLevels 32 use_code_preview 1 time0_warning 1 depth_warning 1 add_error_warning 1 diverge_warning 1}
EndOfStateInfo
# File saved with Nlview version 6.6.36_0 (04/08/25-18:45:38 bk=1.779)
#
property -reset
property autobundle 20
property boxcolor0 #00ffff
property boxcolor1 #999999
property boxinstcolor #ffffff
property boxpincolor #00ffff
property buscolor #ffff00
property closeenough 3
property enablebufferchaincollapsing 1
property enablescrollrect 1
property evaluateattrvalue 1
property extractsequentiallogic 2
property gatepinname 1
property incrementmode 2
property inferbundlename 1
property instattrmax 50
property objecthighlight3 #008000
property objecthighlight4 #ff00ff
property objecthighlight5 #ffd700
property objecthighlight6 #0000ff
property objecthighlight9 #fa8072
property outboxcolor1 #a52a2a
property outboxcolor2 #000000
property outboxcolor4 #000000
property outfblevel 10
property picksubnet 1
property pinattrmax 50
property pinorder 1
property questalayoutimprovement 1
property recursivecallerrorlen 10
property searchvisibleobjects 1
property selectbycolor9 1
property showmarks 1
property shownetattr 5
property showripindex 3
property timelimit 50

module new v {} -nosplit
load symbol /router_test_top/#INITIAL#37 v GEN port SystemClock output.right
load symbol work.test(fast) v HIERGEN boxcolor 1
load symbol work.router(fast) v HIERGEN portBus valido_n output.right 16 {valido_n[0]} {valido_n[1]} {valido_n[2]} {valido_n[3]} {valido_n[4]} {valido_n[5]} {valido_n[6]} {valido_n[7]} {valido_n[8]} {valido_n[9]} {valido_n[10]} {valido_n[11]} {valido_n[12]} {valido_n[13]} {valido_n[14]} {valido_n[15]} port reset_n input.left portBus frame_n input.left 16 {frame_n[0]} {frame_n[1]} {frame_n[2]} {frame_n[3]} {frame_n[4]} {frame_n[5]} {frame_n[6]} {frame_n[7]} {frame_n[8]} {frame_n[9]} {frame_n[10]} {frame_n[11]} {frame_n[12]} {frame_n[13]} {frame_n[14]} {frame_n[15]} portBus dout output.right 16 {dout[0]} {dout[1]} {dout[2]} {dout[3]} {dout[4]} {dout[5]} {dout[6]} {dout[7]} {dout[8]} {dout[9]} {dout[10]} {dout[11]} {dout[12]} {dout[13]} {dout[14]} {dout[15]} portBus busy_n output.right 16 {busy_n[0]} {busy_n[1]} {busy_n[2]} {busy_n[3]} {busy_n[4]} {busy_n[5]} {busy_n[6]} {busy_n[7]} {busy_n[8]} {busy_n[9]} {busy_n[10]} {busy_n[11]} {busy_n[12]} {busy_n[13]} {busy_n[14]} {busy_n[15]} port clock input.left portBus valid_n input.left 16 {valid_n[0]} {valid_n[1]} {valid_n[2]} {valid_n[3]} {valid_n[4]} {valid_n[5]} {valid_n[6]} {valid_n[7]} {valid_n[8]} {valid_n[9]} {valid_n[10]} {valid_n[11]} {valid_n[12]} {valid_n[13]} {valid_n[14]} {valid_n[15]} portBus frameo_n output.right 16 {frameo_n[0]} {frameo_n[1]} {frameo_n[2]} {frameo_n[3]} {frameo_n[4]} {frameo_n[5]} {frameo_n[6]} {frameo_n[7]} {frameo_n[8]} {frameo_n[9]} {frameo_n[10]} {frameo_n[11]} {frameo_n[12]} {frameo_n[13]} {frameo_n[14]} {frameo_n[15]} portBus din input.left 16 {din[0]} {din[1]} {din[2]} {din[3]} {din[4]} {din[5]} {din[6]} {din[7]} {din[8]} {din[9]} {din[10]} {din[11]} {din[12]} {din[13]} {din[14]} {din[15]} boxcolor 1
load symbol work.router_io(fast) v HIERGEN port clock input.left boxcolor 1
load inst /router_test_top/dut work.router(fast) v -fold -attr acc +acc=<full> -attr @name dut -attr @cell work.router(fast) -attr @style dashed -attr @fillcolor #000084 -x 225 -y 160 -pg 1
load inst /router_test_top/#INITIAL#37 /router_test_top/#INITIAL#37 v -autohide -attr @cell {} -attr acc {} -attr @name #INITIAL#37 -attr @abstract_id 2 -attr @block_filled 0 -x 30 -y 40 -pg 1
load inst /router_test_top/top_io work.router_io(fast) v -fold -attr acc +acc=<full> -attr @name top_io -attr @cell work.router_io(fast) -attr @style dashed -attr @fillcolor #000084 -x 225 -y 40 -pg 1
load net {/router_test_top/top_io/frameo_n[9]} -attr @simnet 92 -attr @name {frameo_n[9]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[9]}
load net {/router_test_top/top_io/frame_n[6]} -attr @simnet 24 -attr @name {frame_n[6]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[6]}
load net {/router_test_top/dut/din[13]} -attr @simnet 112 -attr @name {din[13]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[13]}
load net {/router_test_top/dut/valido_n[11]} -attr @simnet 12 -attr @name {valido_n[11]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[11]}
load net {/router_test_top/top_io/dout[8]} -attr @simnet 42 -attr @name {dout[8]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[8]}
load net {/router_test_top/top_io/dout[12]} -attr @simnet 46 -attr @name {dout[12]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[12]}
load net {/router_test_top/top_io/busy_n[0]} -attr @simnet 50 -attr @name {busy_n[0]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[0]}
load net {/router_test_top/dut/busy_n[5]} -attr @simnet 55 -attr @name {busy_n[5]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[5]}
load net {/router_test_top/dut/valid_n[7]} -attr @simnet 74 -attr @name {valid_n[7]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[7]}
load net {/router_test_top/top_io/din[15]} -attr @simnet 114 -attr @name {din[15]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[15]}
load net {/router_test_top/top_io/frame_n[10]} -attr @simnet 28 -attr @name {frame_n[10]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[10]}
load net {/router_test_top/dut/dout[14]} -attr @simnet 48 -attr @name {dout[14]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[14]}
load net {/router_test_top/dut/din[8]} -attr @simnet 107 -attr @name {din[8]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[8]}
load net {/router_test_top/top_io/valid_n[0]} -attr @simnet 67 -attr @name {valid_n[0]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[0]}
load net {/router_test_top/top_io/valid_n[14]} -attr @simnet 81 -attr @name {valid_n[14]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[14]}
load net {/router_test_top/dut/frameo_n[7]} -attr @simnet 90 -attr @name {frameo_n[7]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[7]}
load net {/router_test_top/top_io/busy_n[10]} -attr @simnet 60 -attr @name {busy_n[10]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[10]}
load net {/router_test_top/dut/valido_n[8]} -attr @simnet 9 -attr @name {valido_n[8]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[8]}
load net {/router_test_top/dut/frame_n[1]} -attr @simnet 19 -attr @name {frame_n[1]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[1]}
load net {/router_test_top/top_io/frameo_n[0]} -attr @simnet 83 -attr @name {frameo_n[0]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[0]}
load net {/router_test_top/top_io/valido_n[4]} -attr @simnet 5 -attr @name {valido_n[4]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[4]}
load net {/router_test_top/dut/dout[7]} -attr @simnet 41 -attr @name {dout[7]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[7]}
load net {/router_test_top/dut/busy_n[11]} -attr @simnet 61 -attr @name {busy_n[11]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[11]}
load net {/router_test_top/top_io/din[1]} -attr @simnet 100 -attr @name {din[1]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[1]}
load net {/router_test_top/top_io/frame_n[7]} -attr @simnet 25 -attr @name {frame_n[7]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[7]}
load net {/router_test_top/dut/din[14]} -attr @simnet 113 -attr @name {din[14]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[14]}
load net {/router_test_top/dut/valido_n[12]} -attr @simnet 13 -attr @name {valido_n[12]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[12]}
load net {/router_test_top/top_io/dout[9]} -attr @simnet 43 -attr @name {dout[9]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[9]}
load net {/router_test_top/top_io/dout[13]} -attr @simnet 47 -attr @name {dout[13]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[13]}
load net {/router_test_top/top_io/busy_n[1]} -attr @simnet 51 -attr @name {busy_n[1]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[1]}
load net {/router_test_top/top_io/frameo_n[10]} -attr @simnet 93 -attr @name {frameo_n[10]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[10]}
load net {/router_test_top/dut/busy_n[6]} -attr @simnet 56 -attr @name {busy_n[6]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[6]}
load net {/router_test_top/dut/valid_n[8]} -attr @simnet 75 -attr @name {valid_n[8]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[8]}
load net {/router_test_top/top_io/frame_n[11]} -attr @simnet 29 -attr @name {frame_n[11]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[11]}
load net {/router_test_top/dut/dout[15]} -attr @simnet 49 -attr @name {dout[15]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[15]}
load net {/router_test_top/dut/din[9]} -attr @simnet 108 -attr @name {din[9]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[9]}
load net {/router_test_top/top_io/valid_n[1]} -attr @simnet 68 -attr @name {valid_n[1]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[1]}
load net {/router_test_top/top_io/valid_n[15]} -attr @simnet 82 -attr @name {valid_n[15]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[15]}
load net {/router_test_top/dut/frameo_n[8]} -attr @simnet 91 -attr @name {frameo_n[8]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[8]}
load net {/router_test_top/top_io/valido_n[10]} -attr @simnet 11 -attr @name {valido_n[10]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[10]}
load net {/router_test_top/top_io/busy_n[11]} -attr @simnet 61 -attr @name {busy_n[11]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[11]}
load net {/router_test_top/dut/valido_n[9]} -attr @simnet 10 -attr @name {valido_n[9]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[9]}
load net {/router_test_top/dut/frame_n[2]} -attr @simnet 20 -attr @name {frame_n[2]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[2]}
load net {/router_test_top/top_io/frameo_n[1]} -attr @simnet 84 -attr @name {frameo_n[1]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[1]}
load net {/router_test_top/dut/frameo_n[10]} -attr @simnet 93 -attr @name {frameo_n[10]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[10]}
load net {/router_test_top/top_io/valido_n[5]} -attr @simnet 6 -attr @name {valido_n[5]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[5]}
load net {/router_test_top/dut/dout[8]} -attr @simnet 42 -attr @name {dout[8]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[8]}
load net {/router_test_top/dut/busy_n[12]} -attr @simnet 62 -attr @name {busy_n[12]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[12]}
load net {/router_test_top/top_io/din[2]} -attr @simnet 101 -attr @name {din[2]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[2]}
load net {/router_test_top/top_io/dout[0]} -attr @simnet 34 -attr @name {dout[0]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[0]}
load net {/router_test_top/top_io/frame_n[8]} -attr @simnet 26 -attr @name {frame_n[8]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[8]}
load net {/router_test_top/dut/din[15]} -attr @simnet 114 -attr @name {din[15]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[15]}
load net {/router_test_top/dut/valido_n[13]} -attr @simnet 14 -attr @name {valido_n[13]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[13]}
load net {/router_test_top/top_io/dout[14]} -attr @simnet 48 -attr @name {dout[14]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[14]}
load net {/router_test_top/top_io/busy_n[2]} -attr @simnet 52 -attr @name {busy_n[2]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[2]}
load net {/router_test_top/top_io/frameo_n[11]} -attr @simnet 94 -attr @name {frameo_n[11]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[11]}
load net {/router_test_top/dut/busy_n[7]} -attr @simnet 57 -attr @name {busy_n[7]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[7]}
load net {/router_test_top/dut/valid_n[10]} -attr @simnet 77 -attr @name {valid_n[10]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[10]}
load net {/router_test_top/dut/din[0]} -attr @simnet 99 -attr @name {din[0]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[0]}
load net {/router_test_top/dut/valid_n[9]} -attr @simnet 76 -attr @name {valid_n[9]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[9]}
load net {/router_test_top/top_io/frame_n[12]} -attr @simnet 30 -attr @name {frame_n[12]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[12]}
load net {/router_test_top/dut/valido_n[0]} -attr @simnet 1 -attr @name {valido_n[0]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[0]}
load net {/router_test_top/top_io/valid_n[2]} -attr @simnet 69 -attr @name {valid_n[2]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[2]}
load net {/router_test_top/dut/frameo_n[9]} -attr @simnet 92 -attr @name {frameo_n[9]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[9]}
load net {/router_test_top/top_io/valido_n[11]} -attr @simnet 12 -attr @name {valido_n[11]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[11]}
load net {/router_test_top/top_io/busy_n[12]} -attr @simnet 62 -attr @name {busy_n[12]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[12]}
load net {/router_test_top/dut/frame_n[3]} -attr @simnet 21 -attr @name {frame_n[3]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[3]}
load net {/router_test_top/top_io/frameo_n[2]} -attr @simnet 85 -attr @name {frameo_n[2]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[2]}
load net {/router_test_top/dut/frameo_n[11]} -attr @simnet 94 -attr @name {frameo_n[11]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[11]}
load net {/router_test_top/top_io/valido_n[6]} -attr @simnet 7 -attr @name {valido_n[6]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[6]}
load net {/router_test_top/dut/dout[9]} -attr @simnet 43 -attr @name {dout[9]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[9]}
load net {/router_test_top/dut/busy_n[13]} -attr @simnet 63 -attr @name {busy_n[13]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[13]}
load net /router_test_top/top_io/clock -attr @simnet 66 -attr @name clock -attr @attrvalue 1'h0 -attr @attr 1'h0 -pin /router_test_top/dut clock -hierPin /router_test_top/top_io clock
load net {/router_test_top/top_io/din[3]} -attr @simnet 102 -attr @name {din[3]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[3]}
load net {/router_test_top/top_io/dout[1]} -attr @simnet 35 -attr @name {dout[1]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[1]}
load net {/router_test_top/top_io/frame_n[9]} -attr @simnet 27 -attr @name {frame_n[9]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[9]}
load net /router_test_top/SystemClock -attr @name SystemClock -attr @simnet 472 -attr @attrvalue 1'h0 -attr @attr 1'h0 -pin /router_test_top/#INITIAL#37 SystemClock -pin /router_test_top/top_io clock
load net {/router_test_top/dut/valido_n[14]} -attr @simnet 15 -attr @name {valido_n[14]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[14]}
load net {/router_test_top/top_io/dout[15]} -attr @simnet 49 -attr @name {dout[15]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[15]}
load net {/router_test_top/top_io/busy_n[3]} -attr @simnet 53 -attr @name {busy_n[3]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[3]}
load net {/router_test_top/dut/frame_n[10]} -attr @simnet 28 -attr @name {frame_n[10]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[10]}
load net {/router_test_top/dut/valid_n[0]} -attr @simnet 67 -attr @name {valid_n[0]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[0]}
load net {/router_test_top/top_io/frameo_n[12]} -attr @simnet 95 -attr @name {frameo_n[12]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[12]}
load net {/router_test_top/dut/busy_n[8]} -attr @simnet 58 -attr @name {busy_n[8]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[8]}
load net {/router_test_top/dut/valid_n[11]} -attr @simnet 78 -attr @name {valid_n[11]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[11]}
load net {/router_test_top/dut/din[1]} -attr @simnet 100 -attr @name {din[1]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[1]}
load net {/router_test_top/dut/frameo_n[0]} -attr @simnet 83 -attr @name {frameo_n[0]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[0]}
load net {/router_test_top/top_io/frame_n[13]} -attr @simnet 31 -attr @name {frame_n[13]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[13]}
load net {/router_test_top/dut/valido_n[1]} -attr @simnet 2 -attr @name {valido_n[1]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[1]}
load net {/router_test_top/top_io/valid_n[3]} -attr @simnet 70 -attr @name {valid_n[3]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[3]}
load net /router_test_top/dut/reset_n -attr @simnet 17 -attr @name reset_n -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut reset_n
load net {/router_test_top/dut/dout[0]} -attr @simnet 34 -attr @name {dout[0]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[0]}
load net {/router_test_top/top_io/valido_n[12]} -attr @simnet 13 -attr @name {valido_n[12]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[12]}
load net {/router_test_top/top_io/busy_n[13]} -attr @simnet 63 -attr @name {busy_n[13]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[13]}
load net {/router_test_top/dut/frame_n[4]} -attr @simnet 22 -attr @name {frame_n[4]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[4]}
load net {/router_test_top/top_io/frameo_n[3]} -attr @simnet 86 -attr @name {frameo_n[3]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[3]}
load net {/router_test_top/dut/frameo_n[12]} -attr @simnet 95 -attr @name {frameo_n[12]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[12]}
load net {/router_test_top/top_io/valido_n[7]} -attr @simnet 8 -attr @name {valido_n[7]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[7]}
load net {/router_test_top/top_io/frame_n[0]} -attr @simnet 18 -attr @name {frame_n[0]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[0]}
load net {/router_test_top/dut/busy_n[14]} -attr @simnet 64 -attr @name {busy_n[14]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[14]}
load net {/router_test_top/top_io/din[4]} -attr @simnet 103 -attr @name {din[4]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[4]}
load net {/router_test_top/top_io/dout[2]} -attr @simnet 36 -attr @name {dout[2]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[2]}
load net {/router_test_top/dut/valido_n[15]} -attr @simnet 16 -attr @name {valido_n[15]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[15]}
load net {/router_test_top/top_io/busy_n[4]} -attr @simnet 54 -attr @name {busy_n[4]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[4]}
load net {/router_test_top/dut/frame_n[11]} -attr @simnet 29 -attr @name {frame_n[11]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[11]}
load net {/router_test_top/dut/valid_n[1]} -attr @simnet 68 -attr @name {valid_n[1]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[1]}
load net {/router_test_top/top_io/frameo_n[13]} -attr @simnet 96 -attr @name {frameo_n[13]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[13]}
load net {/router_test_top/dut/busy_n[9]} -attr @simnet 59 -attr @name {busy_n[9]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[9]}
load net {/router_test_top/dut/valid_n[12]} -attr @simnet 79 -attr @name {valid_n[12]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[12]}
load net {/router_test_top/dut/din[2]} -attr @simnet 101 -attr @name {din[2]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[2]}
load net {/router_test_top/dut/frameo_n[1]} -attr @simnet 84 -attr @name {frameo_n[1]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[1]}
load net {/router_test_top/top_io/frame_n[14]} -attr @simnet 32 -attr @name {frame_n[14]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[14]}
load net {/router_test_top/dut/valido_n[2]} -attr @simnet 3 -attr @name {valido_n[2]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[2]}
load net {/router_test_top/top_io/valid_n[4]} -attr @simnet 71 -attr @name {valid_n[4]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[4]}
load net {/router_test_top/dut/dout[1]} -attr @simnet 35 -attr @name {dout[1]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[1]}
load net {/router_test_top/top_io/valido_n[13]} -attr @simnet 14 -attr @name {valido_n[13]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[13]}
load net {/router_test_top/top_io/busy_n[14]} -attr @simnet 64 -attr @name {busy_n[14]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[14]}
load net {/router_test_top/dut/frame_n[5]} -attr @simnet 23 -attr @name {frame_n[5]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[5]}
load net {/router_test_top/top_io/frameo_n[4]} -attr @simnet 87 -attr @name {frameo_n[4]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[4]}
load net {/router_test_top/dut/frameo_n[13]} -attr @simnet 96 -attr @name {frameo_n[13]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[13]}
load net {/router_test_top/top_io/valido_n[8]} -attr @simnet 9 -attr @name {valido_n[8]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[8]}
load net {/router_test_top/top_io/frame_n[1]} -attr @simnet 19 -attr @name {frame_n[1]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[1]}
load net {/router_test_top/dut/busy_n[15]} -attr @simnet 65 -attr @name {busy_n[15]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[15]}
load net {/router_test_top/top_io/din[5]} -attr @simnet 104 -attr @name {din[5]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[5]}
load net {/router_test_top/top_io/dout[3]} -attr @simnet 37 -attr @name {dout[3]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[3]}
load net {/router_test_top/dut/busy_n[0]} -attr @simnet 50 -attr @name {busy_n[0]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[0]}
load net {/router_test_top/top_io/busy_n[5]} -attr @simnet 55 -attr @name {busy_n[5]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[5]}
load net {/router_test_top/dut/frame_n[12]} -attr @simnet 30 -attr @name {frame_n[12]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[12]}
load net {/router_test_top/dut/valid_n[2]} -attr @simnet 69 -attr @name {valid_n[2]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[2]}
load net {/router_test_top/top_io/frameo_n[14]} -attr @simnet 97 -attr @name {frameo_n[14]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[14]}
load net {/router_test_top/top_io/din[10]} -attr @simnet 109 -attr @name {din[10]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[10]}
load net {/router_test_top/dut/valid_n[13]} -attr @simnet 80 -attr @name {valid_n[13]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[13]}
load net {/router_test_top/dut/din[3]} -attr @simnet 102 -attr @name {din[3]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[3]}
load net {/router_test_top/dut/frameo_n[2]} -attr @simnet 85 -attr @name {frameo_n[2]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[2]}
load net {/router_test_top/top_io/frame_n[15]} -attr @simnet 33 -attr @name {frame_n[15]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[15]}
load net {/router_test_top/dut/valido_n[3]} -attr @simnet 4 -attr @name {valido_n[3]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[3]}
load net {/router_test_top/top_io/valid_n[5]} -attr @simnet 72 -attr @name {valid_n[5]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[5]}
load net {/router_test_top/dut/dout[2]} -attr @simnet 36 -attr @name {dout[2]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[2]}
load net {/router_test_top/top_io/valido_n[14]} -attr @simnet 15 -attr @name {valido_n[14]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[14]}
load net {/router_test_top/top_io/busy_n[15]} -attr @simnet 65 -attr @name {busy_n[15]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[15]}
load net {/router_test_top/dut/frame_n[6]} -attr @simnet 24 -attr @name {frame_n[6]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[6]}
load net {/router_test_top/top_io/frameo_n[5]} -attr @simnet 88 -attr @name {frameo_n[5]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[5]}
load net {/router_test_top/dut/frameo_n[14]} -attr @simnet 97 -attr @name {frameo_n[14]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[14]}
load net {/router_test_top/top_io/valido_n[9]} -attr @simnet 10 -attr @name {valido_n[9]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[9]}
load net {/router_test_top/top_io/frame_n[2]} -attr @simnet 20 -attr @name {frame_n[2]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[2]}
load net {/router_test_top/top_io/din[6]} -attr @simnet 105 -attr @name {din[6]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[6]}
load net {/router_test_top/top_io/dout[4]} -attr @simnet 38 -attr @name {dout[4]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[4]}
load net {/router_test_top/dut/busy_n[1]} -attr @simnet 51 -attr @name {busy_n[1]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[1]}
load net {/router_test_top/top_io/busy_n[6]} -attr @simnet 56 -attr @name {busy_n[6]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[6]}
load net {/router_test_top/dut/frame_n[13]} -attr @simnet 31 -attr @name {frame_n[13]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[13]}
load net {/router_test_top/dut/valid_n[3]} -attr @simnet 70 -attr @name {valid_n[3]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[3]}
load net {/router_test_top/top_io/frameo_n[15]} -attr @simnet 98 -attr @name {frameo_n[15]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[15]}
load net {/router_test_top/top_io/din[11]} -attr @simnet 110 -attr @name {din[11]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[11]}
load net {/router_test_top/dut/dout[10]} -attr @simnet 44 -attr @name {dout[10]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[10]}
load net {/router_test_top/dut/valid_n[14]} -attr @simnet 81 -attr @name {valid_n[14]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[14]}
load net {/router_test_top/dut/din[4]} -attr @simnet 103 -attr @name {din[4]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[4]}
load net {/router_test_top/top_io/valid_n[10]} -attr @simnet 77 -attr @name {valid_n[10]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[10]}
load net {/router_test_top/dut/frameo_n[3]} -attr @simnet 86 -attr @name {frameo_n[3]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[3]}
load net {/router_test_top/dut/valido_n[4]} -attr @simnet 5 -attr @name {valido_n[4]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[4]}
load net {/router_test_top/top_io/valid_n[6]} -attr @simnet 73 -attr @name {valid_n[6]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[6]}
load net {/router_test_top/top_io/valido_n[0]} -attr @simnet 1 -attr @name {valido_n[0]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[0]}
load net {/router_test_top/dut/dout[3]} -attr @simnet 37 -attr @name {dout[3]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[3]}
load net {/router_test_top/top_io/valido_n[15]} -attr @simnet 16 -attr @name {valido_n[15]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[15]}
load net {/router_test_top/dut/frame_n[7]} -attr @simnet 25 -attr @name {frame_n[7]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[7]}
load net {/router_test_top/top_io/frameo_n[6]} -attr @simnet 89 -attr @name {frameo_n[6]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[6]}
load net {/router_test_top/dut/frameo_n[15]} -attr @simnet 98 -attr @name {frameo_n[15]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[15]}
load net {/router_test_top/top_io/frame_n[3]} -attr @simnet 21 -attr @name {frame_n[3]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[3]}
load net {/router_test_top/top_io/din[7]} -attr @simnet 106 -attr @name {din[7]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[7]}
load net {/router_test_top/dut/din[10]} -attr @simnet 109 -attr @name {din[10]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[10]}
load net {/router_test_top/top_io/dout[5]} -attr @simnet 39 -attr @name {dout[5]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[5]}
load net {/router_test_top/dut/busy_n[2]} -attr @simnet 52 -attr @name {busy_n[2]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[2]}
load net {/router_test_top/top_io/busy_n[7]} -attr @simnet 57 -attr @name {busy_n[7]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[7]}
load net {/router_test_top/dut/frame_n[14]} -attr @simnet 32 -attr @name {frame_n[14]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[14]}
load net {/router_test_top/dut/valid_n[4]} -attr @simnet 71 -attr @name {valid_n[4]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[4]}
load net {/router_test_top/top_io/din[12]} -attr @simnet 111 -attr @name {din[12]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[12]}
load net {/router_test_top/dut/dout[11]} -attr @simnet 45 -attr @name {dout[11]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[11]}
load net {/router_test_top/dut/valid_n[15]} -attr @simnet 82 -attr @name {valid_n[15]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[15]}
load net {/router_test_top/dut/din[5]} -attr @simnet 104 -attr @name {din[5]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[5]}
load net {/router_test_top/top_io/valid_n[11]} -attr @simnet 78 -attr @name {valid_n[11]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[11]}
load net {/router_test_top/dut/frameo_n[4]} -attr @simnet 87 -attr @name {frameo_n[4]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[4]}
load net {/router_test_top/dut/valido_n[5]} -attr @simnet 6 -attr @name {valido_n[5]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[5]}
load net {/router_test_top/top_io/valid_n[7]} -attr @simnet 74 -attr @name {valid_n[7]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[7]}
load net {/router_test_top/top_io/valido_n[1]} -attr @simnet 2 -attr @name {valido_n[1]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[1]}
load net {/router_test_top/dut/dout[4]} -attr @simnet 38 -attr @name {dout[4]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[4]}
load net {/router_test_top/dut/frame_n[8]} -attr @simnet 26 -attr @name {frame_n[8]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[8]}
load net {/router_test_top/top_io/frameo_n[7]} -attr @simnet 90 -attr @name {frameo_n[7]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[7]}
load net {/router_test_top/top_io/frame_n[4]} -attr @simnet 22 -attr @name {frame_n[4]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[4]}
load net {/router_test_top/top_io/din[8]} -attr @simnet 107 -attr @name {din[8]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[8]}
load net {/router_test_top/dut/din[11]} -attr @simnet 110 -attr @name {din[11]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[11]}
load net {/router_test_top/top_io/dout[6]} -attr @simnet 40 -attr @name {dout[6]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[6]}
load net {/router_test_top/top_io/dout[10]} -attr @simnet 44 -attr @name {dout[10]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[10]}
load net {/router_test_top/dut/busy_n[3]} -attr @simnet 53 -attr @name {busy_n[3]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[3]}
load net /router_test_top/dut/clock -attr @simnet 66 -attr @name clock -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut clock
load net {/router_test_top/top_io/busy_n[8]} -attr @simnet 58 -attr @name {busy_n[8]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[8]}
load net {/router_test_top/dut/frame_n[15]} -attr @simnet 33 -attr @name {frame_n[15]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[15]}
load net {/router_test_top/dut/valid_n[5]} -attr @simnet 72 -attr @name {valid_n[5]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[5]}
load net {/router_test_top/top_io/din[13]} -attr @simnet 112 -attr @name {din[13]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[13]}
load net {/router_test_top/dut/dout[12]} -attr @simnet 46 -attr @name {dout[12]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[12]}
load net {/router_test_top/dut/din[6]} -attr @simnet 105 -attr @name {din[6]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[6]}
load net {/router_test_top/top_io/valid_n[12]} -attr @simnet 79 -attr @name {valid_n[12]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[12]}
load net {/router_test_top/dut/frameo_n[5]} -attr @simnet 88 -attr @name {frameo_n[5]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[5]}
load net /router_test_top/top_io/reset_n -attr @simnet 17 -attr @name reset_n -attr @attrvalue 1'hx -attr @attr 1'hx -pin /router_test_top/dut reset_n
load net {/router_test_top/dut/valido_n[6]} -attr @simnet 7 -attr @name {valido_n[6]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[6]}
load net {/router_test_top/top_io/valid_n[8]} -attr @simnet 75 -attr @name {valid_n[8]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[8]}
load net {/router_test_top/top_io/valido_n[2]} -attr @simnet 3 -attr @name {valido_n[2]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[2]}
load net {/router_test_top/dut/dout[5]} -attr @simnet 39 -attr @name {dout[5]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[5]}
load net {/router_test_top/dut/frame_n[9]} -attr @simnet 27 -attr @name {frame_n[9]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[9]}
load net {/router_test_top/top_io/frameo_n[8]} -attr @simnet 91 -attr @name {frameo_n[8]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frameo_n[8]}
load net {/router_test_top/top_io/frame_n[5]} -attr @simnet 23 -attr @name {frame_n[5]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {frame_n[5]}
load net {/router_test_top/top_io/din[9]} -attr @simnet 108 -attr @name {din[9]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[9]}
load net {/router_test_top/dut/din[12]} -attr @simnet 111 -attr @name {din[12]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[12]}
load net {/router_test_top/dut/valido_n[10]} -attr @simnet 11 -attr @name {valido_n[10]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[10]}
load net {/router_test_top/top_io/dout[7]} -attr @simnet 41 -attr @name {dout[7]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[7]}
load net {/router_test_top/top_io/dout[11]} -attr @simnet 45 -attr @name {dout[11]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {dout[11]}
load net {/router_test_top/dut/busy_n[4]} -attr @simnet 54 -attr @name {busy_n[4]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[4]}
load net {/router_test_top/top_io/busy_n[9]} -attr @simnet 59 -attr @name {busy_n[9]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {busy_n[9]}
load net {/router_test_top/dut/valid_n[6]} -attr @simnet 73 -attr @name {valid_n[6]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {valid_n[6]}
load net {/router_test_top/top_io/din[14]} -attr @simnet 113 -attr @name {din[14]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[14]}
load net {/router_test_top/dut/dout[13]} -attr @simnet 47 -attr @name {dout[13]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[13]}
load net {/router_test_top/dut/din[7]} -attr @simnet 106 -attr @name {din[7]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {din[7]}
load net {/router_test_top/top_io/valid_n[13]} -attr @simnet 80 -attr @name {valid_n[13]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[13]}
load net {/router_test_top/dut/frameo_n[6]} -attr @simnet 89 -attr @name {frameo_n[6]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {frameo_n[6]}
load net {/router_test_top/dut/valido_n[7]} -attr @simnet 8 -attr @name {valido_n[7]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {valido_n[7]}
load net {/router_test_top/dut/frame_n[0]} -attr @simnet 18 -attr @name {frame_n[0]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {frame_n[0]}
load net {/router_test_top/top_io/valid_n[9]} -attr @simnet 76 -attr @name {valid_n[9]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valid_n[9]}
load net {/router_test_top/top_io/valido_n[3]} -attr @simnet 4 -attr @name {valido_n[3]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {valido_n[3]}
load net {/router_test_top/dut/dout[6]} -attr @simnet 40 -attr @name {dout[6]} -attr @attrvalue x -attr @attr x -hierPin /router_test_top/dut {dout[6]}
load net {/router_test_top/dut/busy_n[10]} -attr @simnet 60 -attr @name {busy_n[10]} -attr @attrvalue 1'hx -attr @attr 1'hx -hierPin /router_test_top/dut {busy_n[10]}
load net {/router_test_top/top_io/din[0]} -attr @simnet 99 -attr @name {din[0]} -attr @attrvalue X -attr @attr X -pin /router_test_top/dut {din[0]}
greymode off
show 1
zoom 2.8125
scrollpos -357 1

