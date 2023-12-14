`timescale 1ns/100ps
`include "router_io.sv"
// Lab 1 - Task 3, Step 2
// 
// Declare a program block with arguments to connect
// to modport TB declared in interface
program automatic test(router_io.TB rtr_io);
    `include "router_test.h"
    `include "Packet.sv"
    `include "Driver.sv"
    `include "Receiver.sv"
    `include "Generator.sv"
    `include "Scoreboard.sv"

    int run_for_n_packets;           // number of packets to test
    int TRACE_ON = 0;

    semaphore   sem[];
    Driver      drvr[];
    Receiver    rcvr[];
    Generator   gen;
    Scoreboard  sb;

    initial begin: drv_tran_proc
        $dumpfile("wave.vcd");
        $dumpvars;

        run_for_n_packets = 2000;

        sem = new[16];
        drvr = new[16];
        rcvr = new[16];
        gen = new("gen");
        sb = new("sb");

        foreach (sem[i])
            sem[i] = new(1);
        foreach (drvr[i])
            drvr[i] = new($sformatf("drvr[%0d]", i), i, sem, gen.out_box[i], sb.driver_mbox, rtr_io);
        foreach (rcvr[i])
            rcvr[i] = new($sformatf("rcvr[%0d]", i), i, sb.receiver_mbox, rtr_io);

        reset();

        gen.start();
        sb.start();
        foreach (drvr[i]) drvr[i].start();
        foreach (rcvr[i]) rcvr[i].start();
        
      wait (sb.DONE.triggered);
    end

    // Lab 1 - Task 6, Step 2
    // 
    // Define a task called reset() inside the program to reset DUT per spec.
    task reset();
        if (TRACE_ON) $display("[TRACE]%t :%m", $realtime);
        rtr_io.reset_n = 1'b0;
        rtr_io.cb.frame_n <= '1;
        rtr_io.cb.valid_n <= '1;
        repeat(2) @(rtr_io.cb); rtr_io.cb.reset_n <= 1'b1;
        repeat(15) @(rtr_io.cb);
    endtask: reset

endprogram: test

