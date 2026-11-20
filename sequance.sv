class my_sequence extends uvm_sequence #(seq_item);

   `uvm_object_utils(my_sequence)

  seq_item seq;

  function new(string name = "my_sequence");
        super.new(name);
         `uvm_info("CONSTRUCTOR", "Calling from the sequence", UVM_NONE)
  endfunction

  task body();
    repeat (20) begin
    seq = seq_item::type_id::create("seq");
  
      start_item(seq);

    if (!seq.randomize())
      `uvm_fatal("RAND", "Randomization failed")

      `uvm_info("SEQ", $sformatf("addr=%b rw=%0b data=%0b start=%0b", seq.addr, seq.rw, seq.data, seq.start), UVM_NONE)


    finish_item(seq);
    end
  endtask

endclass
