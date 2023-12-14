`ifndef INC_RECEIVERBASE_SV
`define INC_RECEIVERBASE_SV

`include "Packet.sv"

class ReceiverBase;
    virtual     router_io.TB rtr_io;	// interface signals
    string      name;		            // unique identifier
    bit[3:0]    da;			            // output port to monitor
    logic[7:0]  pkt2cmp_payload[$];	    // actual payload array
    Packet      pkt2cmp;		        // actual Packet object
//     int TRACE_ON = 0;

    extern function new(string name = "ReceiverBase", virtual router_io.TB rtr_io);
    extern virtual task recv();
    extern virtual task get_payload();
endclass

function ReceiverBase::new(string name, virtual router_io.TB rtr_io);
    if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, name);
    this.name = name;
    this.rtr_io = rtr_io;
    this.pkt2cmp = new();
endfunction

task ReceiverBase::recv();
    static int pkt_cnt = 0;
    if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);
    this.get_payload();
    this.pkt2cmp.da = da;
    this.pkt2cmp.payload = this.pkt2cmp_payload;
    this.pkt2cmp.name = $psprintf("rcvdPkt[%0d]", pkt_cnt++);
endtask

task ReceiverBase::get_payload();
    if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, this.name);

    // Remove potential residues from previous packet
    this.pkt2cmp_payload.delete();

    // Watchdog Timer
    fork
      begin: wd_timer_fork
        fork: frameo_wd_timer
          // Thread 1: Wait for the falling edge of the output frame signal
          @(negedge this.rtr_io.cb.frameo_n[da]);

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
        if (!this.rtr_io.cb.valido_n[da]) begin
          datum[i++] = this.rtr_io.cb.dout[da];
        end

        // Store each 8-bit datum into queue
        if (i == 8) this.pkt2cmp_payload.push_back(datum);

        // Detect frameo_n[da]
        if (this.rtr_io.cb.frameo_n[da]) begin
          if (i == 8) return;
          else begin
            $display("\n%m\n [ERROR] %t Packet payload not byte aligned ! \n", $realtime);
            $finish;
          end
        end

        @(this.rtr_io.cb);
      end: store_datum
    end: frameo_dct_loop

endtask
`endif
