# Makefile for SystemVerilog Lab4
RTL= ../rtl/router.v
BADRTL= ../rtl/bad/router.v
SVTB = ./router_test_top.sv ./router_io.sv ./test.sv
SEED = 1

default: test 

test: compile run

bad: compile_bad run

run:
	vsim -voptargs=+acc -classdebug -sv_seed $(SEED) work.router_test_top

compile:
	vlog -sv $(SVTB) $(RTL)

compile_bad:
	vlog -sv $(SVTB) $(BADRTL)

debug:
	vsim -debugDB work.router_test_top

copy:
	cp ../lab3/*.sv .

clean:
	rm -rf simv* csrc* *.tmp *.vpd *.key *.log *hdrs.h

nuke: clean
	rm -rf *.v* *.sv include .*.lock .*.old DVE* *.tcl *.h

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
	@echo  " debug      => Runs the simulation in debug mode.                       "
	@echo  " clean      => Removes all intermediate simv and log files.             "
	@echo  "                                                                        "
	@echo  " -------------------- ADMINISTRATIVE TARGETS ---------------------------"
	@echo  " help       => Displays this message.                                   "
	@echo  " copy       => Copies lab files from previous working directory         "
	@echo  " nuke       => Erases all changes. Put all files back to original state "
	@echo  "				     			                "
	@echo ===========================================================================

