`ifndef INC_RECEIVER_SV
`define INC_RECEIVER_SV
`include "ReceiverBase.sv"

class Receiver extends ReceiverBase;
    pkt_mbox out_box;	// Scoreboard mailbox
//     int TRACE_ON = 0;

    extern function new(string name = "Receiver", int port_id, pkt_mbox out_box, virtual router_io.TB rtr_io);
    extern virtual task start();
endclass: Receiver

function Receiver::new(string name, int port_id, pkt_mbox out_box, virtual router_io.TB rtr_io);
    // Lab 5 - Task 6, Step 1
    // 
    // Call super.new() with name and interface arguments
    super.new(name, rtr_io);

    // Lab 5 - Task 6, Step 2
    // 
    // Add a tracing statement
    if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, name);

    // Lab 5 - Task 6, Step 3
    // 
    // Assign port_id argument to class property da
    this.da = port_id;

    // Lab 5 - Task 6, Step 4
    // 
    // Assign the correct argument to out_box class property
    this.out_box = out_box;
endfunction: new

task Receiver::start();
    // Lab 5 - Task 7, Step 1
    // 
    // In the existing start() method body, add a trace statement
    if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);

    // Lab 5 - Task 7, Step 2
    // 
    // After the trace statement, create a non-blocking concurrent process
    fork
        // Lab 5 - Task 7, Step 3
        // 
        // Inside the fork-join construct, create a single infinite loop
        forever begin: inf_loop
            // Lab 5 - Task 7, Step 4a
            // 
            // Call recv() to retrieve a Packet object from DUT
            this.recv();

            // Lab 5 - Task 7, Step 4b
            // 
            // Deposit a COPY of the Packet object (pkt2cmp) retrieved
            // from DUT into out_box.
            begin
                Packet pkt = new pkt2cmp;     // COPY pkt2cmp to pkt
                this.out_box.put(pkt);
            end
        end: inf_loop
    join_none
endtask: start
`endif

// Do not uncomment!
//
// class ReceiverBase;
//   virtual router_io.TB rtr_io;	// interface signals
//   string   name;			// unique identifier
//   bit[3:0] da;			// output port to monitor
//   logic[7:0] pkt2cmp_payload[$];	// actual payload array
//   Packet   pkt2cmp;			// actual Packet object
//
//   extern function new(string name = "ReceiverBase", virtual router_io.TB rtr_io);
//   extern virtual task recv();
//   extern virtual task get_payload();
// endclass
