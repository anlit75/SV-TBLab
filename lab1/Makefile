# Makefile for SystemVerilog Lab1
RTL= ../rtl/router.v
SVTB = ./router_test_top.sv ./router_io.sv ./test.sv
SEED = 1

default: test 

test: compile run

run:
	vsim -voptargs=+acc -classdebug -sv_seed $(SEED) work.router_test_top

compile:
	vlog -sv $(SVTB) $(RTL)

debug:
	vsim -debugDB work.router_test_top

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.key *.log *hdrs.h

nuke: clean
	rm -rf *.v* *.sv include .*.lock .*.old DVE* *.tcl *.h

help:
	@echo ==========================================================================
	@echo  " 								       "
	@echo  " USAGE: make target <SEED=xxx>                                         "
	@echo  " 								       "
	@echo  " ------------------------- Test TARGETS ------------------------------ "
	@echo  " test       => Compile TB and DUT files, runs the simulation.          "
	@echo  " compile    => Compile the TB and DUT.                                 "
	@echo  " run        => Run the simulation.                                     "
	@echo  " debug      => Runs simulation interactively with dve                  "
	@echo  " clean      => Remove all intermediate simv and log files.             "
	@echo  "                                                                       "
	@echo  " -------------------- ADMINISTRATIVE TARGETS ------------------------- "
	@echo  " help       => Displays this message.                                  "
	@echo  " nuke       => Erase all changes. Put all files back to original state "
	@echo  "								       "
	@echo ==========================================================================
