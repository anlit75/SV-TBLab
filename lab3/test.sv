`timescale 1ns/100ps
// Lab 1 - Task 3, Step 2
// 
// Declare a program block with arguments to connect
// to modport TB declared in interface
program automatic test(router_io.TB rtr_io);
  int run_for_n_packets;           // number of packets to test  

  // Lab 2 - Task 2, Step 2
  // 
  // Declare program global variables
  bit   [3:0] sa;                  // source address (input port)
  bit   [3:0] da;                  // destination address (output port)
  logic [7:0] payload[$];          // packet data array ([$] is a queue)

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
    $dumpfile("wave.vcd");
    $dumpvars;

    run_for_n_packets = 2000;

    repeat(run_for_n_packets) begin
      // Lab 2 - Task 3, Step 1
      // 
      // Call gen() task
      gen();
      repeat(5) @(rtr_io.cb);

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
    repeat(2) @(rtr_io.cb); rtr_io.cb.reset_n <= 1'b1;
    repeat(15) @(rtr_io.cb);
  endtask: reset

  // Lab 2 - Task 3, Step 2 and 3
  // 
  // Define a task called gen() to generate packet data
  task gen();
    sa = $urandom;            // source address
    da = $urandom;            // destination address
    payload.delete();
    // $urandom_range(max, min=0): retrun unsigned int value in range min ~ max
    repeat($urandom_range(2, 4))
      payload.push_back($urandom);  // $urandom: retrun 32bits unsigned int value

    $display("[GEN]%t sa = %0d, da = %0d", $realtime, sa, da);
    foreach(payload[i])
      $display("[GEN]%t payload[%0d] = %0d", $realtime, i, payload[i]);
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
        rtr_io.cb.frame_n[sa] <= ((idx == (payload.size()-1)) && (i == 7));
        @(rtr_io.cb);
      end
    end
    rtr_io.cb.valid_n[sa] <= 1'b1;
  endtask: send_payload

  // Lab 3 - Task 3, Step 1 and 2
  // 
  // Define a task called recv()
  task recv();
    get_payload();
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
            repeat(1000) @(rtr_io.cb);
            $display ("\n%m\n [ERROR] %t Frame signal timed out!\n", $realtime);
            $finish;
          end          
        join_any: frameo_wd_timer
        disable fork;
      end: wd_timer_fork
    join

    // Loop until output frame is detected
    forever begin: frameo_dct_loop
      logic [7:0] datum;

      // assemble a byte of data at a time (minimum of 8 clock cycles)
      for (int i=0; i<8; i=i) begin: store_datum
        if (!rtr_io.cb.valido_n[da]) begin
          datum[i++] = rtr_io.cb.dout[da];
        end

        // Store each 8-bit datum into queue
        if (i == 8) pkt2cmp_payload.push_back(datum);

        // Detect frameo_n[da]
        if (rtr_io.cb.frameo_n[da]) begin
          if (i == 8) return;
          else begin
            $display("\n%m\n [ERROR] %t Packet payload not byte aligned ! \n", $realtime);
            $finish;
          end
        end

        @(rtr_io.cb);
      end: store_datum
    end: frameo_dct_loop
  endtask: get_payload

  // Lab 3 - Task 4, Step 1 ~ 2
  // 
  // Define a function called compare()
  function bit compare(ref string msg);
    if (payload.size() != pkt2cmp_payload.size()) begin
      msg = "Payload Size Mismatch:\n";
      msg = {msg, $sformatf("payload.size() = %0d, pkt2cmp_payload.size () = %0d\n", payload.size (), pkt2cmp_payload.size())};
      return(0);
    end

    if (payload == pkt2cmp_payload) begin
      msg = "Successfu11y Compaired"; 
      return(1);
    end
    else begin
      msg = "Payload Content Mismatch:\n";
      msg = {msg, $sformatf("Packet Sent: %p\nPkt Received: %p", payload, pkt2cmp_payload)}; 
      return(0);
    end
  endfunction

  // Lab 3 - Task 4, Step 3 ~ 6
  // 
  // Define a task called check()
  task check();
    string msg;
    static int pkts_checked;

    if (!compare(msg)) begin
      $display ("\n%m\n [ERROR] %t Packet #%0d %s\n", $realtime, pkts_checked, msg);
      $finish;
    end
    else
      $display("[NOTE]%t Packet #%0d %s", $realtime, pkts_checked++, msg);
  endtask: check

endprogram: test

