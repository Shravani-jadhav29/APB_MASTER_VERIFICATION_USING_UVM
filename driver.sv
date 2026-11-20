class my_driver extends uvm_driver #(seq_item);

  `uvm_component_utils(my_driver)

  virtual intf inf1;
  seq_item req;

  function new(string name = "my_driver",
               uvm_component parent = null);
    super.new(name, parent);
    `uvm_info("CONSTRUCTOR", "Calling from driver", UVM_NONE)
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual intf)::get(
          this, "", "vif", inf1))
      `uvm_fatal("NOVIF", "Virtual interface not found")

    `uvm_info("BUILD", "Calling from driver", UVM_NONE)
  endfunction


 
  task run_phase(uvm_phase phase);
    `uvm_info("RUN", "Calling from driver", UVM_NONE)
    inf1.start <= 0;
    wait (inf1.rst == 0);

    forever begin
      seq_item_port.get_next_item(req);
         drive(req);
       seq_item_port.item_done();
    end
  endtask

  task drive(seq_item req);
    inf1.start <= 0;
    wait (inf1.rst == 0);
 
    @(posedge inf1.clk);
     inf1.start <= req.start;
      inf1.rw     <= req.rw;
     inf1.addr<= req.addr;
    inf1.data <= req.data;
    @(posedge inf1.clk);
      inf1.start <= 0;
    do @(posedge inf1.clk); while (!inf1.done);   // wait for the DUT to finish
  endtask

    endclass

//   task run_phase(uvm_phase phase);
//     super.run_phase(phase);

//     `uvm_info("RUN", "Calling from driver", UVM_NONE)

//     forever begin
//       seq_item_port.get_next_item(req);
//       drive(req);
//       seq_item_port.item_done();
//     end
//   endtask

//   task drive(seq_item req);
//     @(posedge inf1.clk);

//     inf1.start <= req.start;
//     inf1.rw    <= req.rw;
//     inf1.addr  <= req.addr;
//     inf1.data  <= req.data;

//    @(posedge inf1.clk);
//       inf1.start <= 0;  
//   endtask

// endclass


//    task run_phase(uvm_phase phase);
//      inf1.start <= 0;
//      wait (inf1.rst == 0);
//      forever begin
//        seq_item_port.get_next_item(req);
//        drive(req);
//        seq_item_port.item_done();
//      end
//    endtask

//    task drive(seq_item req);
//      @(posedge inf1.clk);
//      inf1.start <= req.start;
//      inf1.rw    <= req.rw;
//      inf1.addr  <= req.addr;
//      inf1.data  <= req.data;
//      @(posedge inf1.clk);
//      inf1.start <= 0;
//      do @(posedge inf1.clk); while (!inf1.done);
//    endtask
//     endclass
