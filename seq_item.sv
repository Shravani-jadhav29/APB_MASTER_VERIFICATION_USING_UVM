class seq_item extends uvm_sequence_item;

  // Master request inputs
  rand bit [3:0]   addr;
    rand bit rw;                // 1 = Write, 0 = Read
  rand bit [3:0] data;
   rand bit start;

  
  bit psel;
    bit penable;
   bit pwrite;
  bit   [3:0] paddr;
   bit [3:0]  pwdata;

  
   bit pready;
    bit pslverr;
  bit [3:0]   prdata;

 
  bit [3:0] read_data;
    bit done;
   bit error;

  constraint c_start { start == 1; }

  `uvm_object_utils_begin(seq_item)
    `uvm_field_int(addr, UVM_ALL_ON)
   `uvm_field_int(rw, UVM_ALL_ON)
      `uvm_field_int(data, UVM_ALL_ON)
    `uvm_field_int(start, UVM_ALL_ON)

    `uvm_field_int(psel, UVM_ALL_ON)
     `uvm_field_int(penable, UVM_ALL_ON)
      `uvm_field_int(pwrite, UVM_ALL_ON)
    `uvm_field_int(paddr, UVM_ALL_ON)
    `uvm_field_int(pwdata, UVM_ALL_ON)

      `uvm_field_int(pready, UVM_ALL_ON)
    `uvm_field_int(pslverr, UVM_ALL_ON)
      `uvm_field_int(prdata, UVM_ALL_ON)

    `uvm_field_int(read_data, UVM_ALL_ON)
      `uvm_field_int(done, UVM_ALL_ON)
      `uvm_field_int(error, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "seq_item");
    super.new(name);
  endfunction

endclass
