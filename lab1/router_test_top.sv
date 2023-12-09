// Lab 1 - Task 4, Step 6a
// 
// Add `timescale
`timescale 1ns/100ps

module router_test_top;
  parameter simulation_cycle = 100;

  bit SystemClock;

  // Lab 1 - Task 4, Step 3
  // 
  // Add an interface instance
  router_io top_io(SystemClock);
  
  // Lab 1 - Task 4, Step 4
  // 
  // Instantiate the test program
  // Make I/O connection via interface
  test t(top_io);

  router dut(
    // Lab 1 - Task 4, Step 5
    // 
    // Modify DUT connection to connect via interface
    .reset_n  (top_io.reset_n),
    .clock    (top_io.clock),
    .din      (top_io.din),
    .frame_n  (top_io.frame_n),
    .valid_n  (top_io.valid_n),
    .dout     (top_io.dout),
    .valido_n (top_io.valido_n),
    .busy_n   (top_io.busy_n),
    .frameo_n (top_io.frameo_n)
  );

  initial begin
    // Lab 1 - Task 4, Step 6b
    // 
    // Add $timeformat
    $timeformat(-9, 1, "ns", 10);

    SystemClock = 0;
    forever begin
      #(simulation_cycle / 2)
        SystemClock = ~SystemClock;
    end
  end

endmodule
