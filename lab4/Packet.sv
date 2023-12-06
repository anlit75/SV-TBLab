// Lab 4 - Task 2, Step 1~4
// 
// Create a Packet class to encapsulate the packet information
`ifndef INC_PACKET_SV
`define INC_PACKET_SV

class Packet;

  rand bit[3:0] sa, da;          // random port selectio
  rand logic[7:0] payload[$];    // random payload array
  string name; 

  // Lab 4 - Task 3
  // 
  // Define packet property constraint
  constraint cons {
    sa inside {[0:15]};
    da inside {[0:15]};
    payload.size() inside {[2:4]};
  }
  
  // Lab 4 - Task 4
  // 
  // Define packet class method prototypes
  extern function new(string name = "Packet");
  extern function bit compare(Packet pkt2cmp, ref string msg);
  extern function void display(string prefix = "NOTE");

endclass: Packet

// Lab 4 - Task 5
// 
// Define packet class new() constructor
function Packet::new(string name);
  this.name = name;
endfunction: new

// Lab 4 - Task 6
// 
// Define packet compare() method
function bit Packet::compare(Packet pkt2cmp, ref string msg);
  if (payload.size() != pkt2cmp.payload.size()) begin
    msg = "Payload Size Mismatch:\n";
    msg = {msg, $sformatf("payload.size() = %0d, pkt2cmp_payload.size () = %0d\n", payload.size (), pkt2cmp.payload.size())};
    return(0);
  end

  if (payload != pkt2cmp.payload) begin
    msg = "Payload Content Mismatch:\n";
    msg = {msg, $sformatf("Packet Sent: %p\nPkt Received: %p", payload, pkt2cmp.payload)}; 
    return(0);
  end

  msg = "Successfu11y Compaired"; 
  return(1);
endfunction: compare

// Lab 4 - Task 7
// 
// Define packet display() method
function void Packet::display(string prefix);
  $display("[%s]%t %s sa = %0d, da = %0d", prefix, $realtime, name, sa, da);
  foreach(payload[i])
    $display("[%s]%t %s payload[%0d] = %0d", prefix, $realtime, name, i, payload[i]);
endfunction: display

`endif
