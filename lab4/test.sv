`timescale 1ns/100ps
// Lab 1 - Task 3, Step 2
// 
// Declare a program block with arguments to connect
// to modport TB declared in interface
program automatic test(router_io.TB rtr_io);
  // Lab 4 - Task 8
  // 
  // Create Packet object pkt2send, pkt2cmp
  `include "Packet.sv"
  Packet pkt2send = new();
  Packet pkt2cmp = new();

  int run_for_n_packets; // number of packets to test  

  // Lab 2 - Task 2, Step 2
  // 
  // Declare program global variables
  bit [3:0] sa;            // source address (input port)
  bit [3:0] da;            // destination address (output port)
  logic [7:0] payload[$];  // packet data array ([$] is a queue)

  // Lab 3 - Task 2, Step 2
  logic [7:0] pkt2cmp_payload[$];  // this queue store the data sampled from the DUT

  // Lab 1 - Task 3, Step 3
  // 
  // Declare an initial block 
  // In the initial block print a simple message to the screen
  initial begin
    $display("Lab 1: build a testbench!");
  end

  initial begin: drv_rst_proc
    // Lab 1 - Task 6, Steps 3 and 4
    // 
    // Call reset() task
    reset();
  end

  initial begin: drv_tran_proc
    run_for_n_packets = 200;

    repeat(run_for_n_packets) begin
      // Lab 2 - Task 3, Step 1
      // 
      // Call gen() task
      gen();

      // Lab 3 - Task 2, Step 3
      // 
      // Self-checking
      fork
        // Lab 2 - Task 4, Step 1
        // 
        // Call send() task
        send();

        // Lab 3 - Task 2, Step 3
        // 
        // Call recv() task
        recv();
      join

      // Lab 3 - Task 2, Step 3
      // 
      // Call check() task
      check();
    end
    repeat(10) @(rtr_io.cb);
  end

  // Lab 1 - Task 6, Step 2
  // 
  // Define a task called reset() inside the program to reset DUT per spec.
  task reset();
    rtr_io.reset_n = 1'b0;
    rtr_io.cb.frame_n <= '1;
    rtr_io.cb.valid_n <= '1;
    repeat(2) @(rtr_io.cb) rtr_io.cb.reset_n <= 1'b1;
    repeat(15) @(rtr_io.cb);
  endtask: reset

  // Lab 4 - Task 9
  // 
  // Modify gen() to generate packet objects
  task gen();
    static int pkts_generated = 0;
    pkt2send.name = $sformatf("Packet[%0d]", pkts_generated);

    if (!pkt2send.randomize()) begin
      $display("\n%m\n[ERROR]%t Randomization Failed!", $realtime);
      $finish;
    end

    sa = pkt2send.sa;
    da = pkt2send.da;
    payload = pkt2send.payload;
  endtask: gen

  // Lab 2 - Task 4, Step 3 and 4
  // 
  // Define a task called send()
  task send();
    send_addrs();
    send_pad();
    send_payload();
  endtask: send

  // Lab 2 - Task 4, Step 5 and 6
  // 
  // Define a task called send_addrs()
  task send_addrs();
    rtr_io.cb.frame_n[sa] <= 1'b0;
    for (int i=0; i<4; i++) begin
      rtr_io.cb.din[sa] <= da[i];
      @(rtr_io.cb);
    end
  endtask: send_addrs

  // Lab 2 - Task 4, Step 7 and 8
  // 
  // Define a task called send_pad()
  task send_pad();
    rtr_io.cb.din[sa] <= 1'b1;
    rtr_io.cb.valid_n[sa] <= 1'b1;
    rtr_io.cb.frame_n[sa] <= 1'b0;
    repeat(5) @(rtr_io.cb);
  endtask: send_pad

  // Lab 2 - Task 4, Step 9 and 10
  // 
  // Define a task called send_payload()
  task send_payload();
    foreach (payload[idx]) begin
      for (int i=0; i<8; i++) begin
        rtr_io.cb.din[sa] <= payload[idx][i];
        rtr_io.cb.valid_n[sa] <= 1'b0;
        rtr_io.cb.frame_n[sa] <= (idx == (payload.size()-1) && i == 7);
        @(rtr_io.cb);
      end
    end
    rtr_io.cb.valid_n[sa] <= 1'b1;
    @(rtr_io.cb);
  endtask: send_payload

  // Lab 4 - Task 10
  // 
  // Modify recv()
  task recv();
    static int pkt_cnt = 0;
    get_payload();

    pkt2cmp.da = da;
    pkt2cmp.payload = pkt2cmp_payload;
    pkt2cmp.name = $sformatf("[rcvdPkt%0d]", pkt_cnt++);
  endtask: recv

  // Lab 3 - Task 3, Step 3 ~ 7
  // 
  // Define a task called get_payload()
  task get_payload();
    // Remove potential residues from previous packet
    pkt2cmp_payload.delete();
  
    // Watchdog Timer
    fork
      begin: wd_timer_fork
        fork: frameo_wd_timer
          // Thread 1: Wait for the falling edge of the output frame signal
          @(negedge rtr_io.cb.frameo_n[da]);

          // Thread 2: Routines timeout if a problem occurs
          begin
            repeat(100) @(rtr_io.cb);
            $display ("\n%m\n [ERROR] %t Frame signal timed out!\n", $realtime);
            $finish;
          end          
        join_any: frameo_wd_timer
        disable fork;
      end: wd_timer_fork
    join

    // Loop until output frame is detected
    forever begin
      logic [7:0] datum;

      // assemble a byte of data at a time (minimum of 8 clock cycles)
      for (int i=0; i<8; i++) begin
        if (!rtr_io.cb.valido_n[da]) begin
          datum[i] = rtr_io.cb.dout[da];
        end

        // Store each 8-bit datum into queue
        if (rtr_io.cb.frameo_n[da]) begin
          if (i == 7) begin
            pkt2cmp_payload.push_back(datum);
            return;
          end
          else begin
            $display("\n%m\n [ERROR] %t Packet payload not byte aligned ! \n", $realtime);
            $finish;
          end
        end

        @(rtr_io.cb);
      end
    end
  endtask: get_payload

  // Lab 4 - Task 11
  // 
  // Modify the check() task
  task check();
    string msg;
    static int pkts_checked = 0;

    if (!pkt2send.compare(pkt2cmp, msg)) begin
      $display ("\n%m\n [ERROR] %t Packet #%0d %s\n", $realtime, pkts_checked, msg);
      $finish;
    end
    else
      $display("[NOTE]%t Packet #%0d %s", $realtime, pkts_checked++, msg);
  endtask: check

endprogram: test

