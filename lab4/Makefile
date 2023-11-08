# Makefile for SystemVerilog Lab4
RTL= ../../rtl/router.v
BADRTL= ../../rtl/bad/router.v
SVTB = ./router_test_top.sv ./router_io.sv ./test.sv
SEED = 1

default: test 

test: compile run

bad: compile_bad run

run:
	./simv -l simv.log +ntb_random_seed=$(SEED)

compile:
	vcs -l vcs.log -sverilog -debug_all $(SVTB) $(RTL)

compile_bad:
	vcs -l vcs.log -sverilog -debug_all $(SVTB) $(BADRTL)

template:
	ntb_template -t router -c clock ../../rtl/router.v

dve:
	dve -vpd vcdplus.vpd &

debug:
	./simv -l simv.log -gui -tbug +ntb_random_seed=$(SEED)

copy:
	cp ../../solutions/lab3/*.sv .
	cp ../../solutions/lab4/test.sv.orig test.sv
	cp ../../solutions/lab4/Packet.sv.orig Packet.sv

mycopy:
	cp ../lab3/*.sv .

solution: clean
	cp ../../solutions/lab4/*.sv .

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.key *.log *hdrs.h

nuke: clean
	rm -rf *.v* include *.sv .*.lock .*.old DVE* *.tcl *.h

help:
	@echo ===========================================================================
	@echo  " 								        "
	@echo  " USAGE: make target <SEED=xxx>                                          "
	@echo  " 								        "
	@echo  " ------------------------- Test TARGETS --------------------------------"
	@echo  " test       => Compiles TB and GOOD DUT files, runs the simulation.     "
	@echo  " bad        => Compiles TB and BAD DUT files, runs the simulation.      "
	@echo  " compile    => Compiles the TB and DUT.                                 "
	@echo  " run        => Runs the simulation.                                     "
	@echo  " template   => Builds ntb templates                                     "
	@echo  " dve        => Runs dve in post-processing mode                         "
	@echo  " debug      => Runs simulation interactively with dve                   "
	@echo  " clean      => Removes all intermediate simv and log files.             "
	@echo  "                                                                        "
	@echo  " -------------------- ADMINISTRATIVE TARGETS ---------------------------"
	@echo  " help       => Displays this message.                                   "
	@echo  " copy       => Copies lab files from previous working  directory        "
	@echo  " mycopy     => Copies lab files from previous solution  directory       "
	@echo  " solution   => Copies all files from current solutions directory        "
	@echo  " nuke       => Erases all changes. Put all files back to original state "
	@echo  "				     			                "
	@echo ===========================================================================

