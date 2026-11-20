class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)

  seq_item seq2;
  virtual intf vif;

  uvm_analysis_port #(seq_item) ap_mon;

  function new(string name = "my_monitor",
               uvm_component parent = null);
    super.new(name, parent);

    ap_mon = new("ap_mon", this);

    `uvm_info("constructor", "Calling from monitor", UVM_NONE)
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual intf)::get(
        this, "", "vif", vif))
      `uvm_fatal("monitor", "Virtual interface not found")

      `uvm_info("build", "Monitor build phase", UVM_NONE)
  endfunction

//   task run_phase(uvm_phase phase);
//     super.run_phase(phase);

//     forever begin
//       @(posedge vif.clk);

//       if (vif.psel && vif.penable && vif.pready) begin
//         seq2 = seq_item::type_id::create("seq2");

//         seq2.psel = vif.psel;
//         seq2.penable = vif.penable;
//         seq2.paddr = vif.addr;
//         seq2.pwrite = vif.rw;
//         seq2.pwdata = vif.data;
//         seq2.pready = vif.start;
//         seq2.prdata = vif.read_data;
//         seq2.pslverr = vif.error;
//        // seq2.read_data = vif.read_data;
//        // seq2.done  = vif.done;
//        // seq2.error  = vif.error;

//         ap_mon.write(seq2);

//         `uvm_info("MONITOR", "APB transaction observed", UVM_MEDIUM)
//       end
//     end
//   endtask

task run_phase(uvm_phase phase);

  bit state_bit = 0;

  super.run_phase(phase);

  forever begin
    @(negedge vif.clk);

    if (vif.rst) begin
      state_bit = 0;
      continue;
    end

    if (vif.start && !state_bit) begin

       seq2 = seq_item::type_id::create("seq2");

      seq2.start = vif.start;
        seq2.addr = vif.addr;
      seq2.rw  = vif.rw;
       seq2.data = vif.data;

      state_bit = 1;
    end

   
    if (state_bit && vif.psel && vif.penable && vif.pready) begin

      seq2.psel  = vif.psel;
       seq2.penable = vif.penable;
      seq2.pwrite = vif.pwrite;
       seq2.paddr = vif.paddr;
      seq2.pwdata  = vif.pwdata;
       seq2.pready = vif.pready;
      seq2.prdata  = vif.prdata;
      seq2.pslverr = vif.pslverr;

    end

    if (state_bit && vif.done) begin

      seq2.read_data = vif.read_data;
      seq2.error = vif.error;
      seq2.done  = vif.done;

      ap_mon.write(seq2);

      `uvm_info("MONITOR", "APB transaction observed", UVM_MEDIUM)

      state_bit = 0;
    end

  end

endtask



    endclass
