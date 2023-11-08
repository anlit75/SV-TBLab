`timescale 1ns/100ps
// Lab 1 - Task 3, Step 2
// 
// Declare a program block with arguments to connect
// to modport TB declared in interface
program automatic test(router_io.TB rtr_io);
  // Lab 2 - Task 2, Step 2
  // 
  // Declare program global variables
  bit [3:0] sa;            // source address (input port)
  bit [3:0] da;            // destination address (output port)
  logic [7:0] payload[$];  // packet data array ([$] is a queue)

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
    // Lab 2 - Task 3, Step 1
    // 
    // Call gen() task
    gen();

    // Lab 2 - Task 4, Step 1
    // 
    // Call send() task
    send();
  end

  // Lab 1 - Task 6, Step 2
  // 
  // Define a task called reset() inside the program to reset DUT per spec.
  task reset();
    rtr_io.reset_n = 1'b0;
    rtr_io.cb.frame_n <= '1;
    rtr_io.cb.valid_n <= '1;
    #2 rtr_io.cb.reset_n <= 1'b1;
    repeat(15) @(rtr_io.cb);
  endtask: reset

  // Lab 2 - Task 3, Step 2 and 3
  // 
  // Define a task called gen() to generate packet data
  task gen();
    sa = 3;            // source address
    da = 7;            // destination address
    payload.delete();
    // $urandom_range(max, min=0): retrun unsigned int value in range min ~ max
    repeat($urandom_range(2, 4))
      payload.push_back($urandom);  // $urandom: retrun 32bits unsigned int value
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
        rtr_io.cb.frame_n[sa] <= (idx == payload.size()-1 && i == 7) ? 1'b1 : 1'b0;
        @(rtr_io.cb);
      end
    end
    rtr_io.cb.valid_n[sa] <= 1'b1;
    @(rtr_io.cb);
  endtask: send_payload

endprogram: test

