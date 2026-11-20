`timescale 1ns/1ns
`include "uvm_macros.svh"
`include "interface.sv"

package apb_pkg;
    import uvm_pkg::*;
  //import uvm_pkg::*;
//     `include "uvm_macros.svh"
//     `include "interface.sv"

    `include "seq_item.sv"
    `include "sequance.sv"
    `include "sequancer.sv"
    `include "driver.sv"
    `include "monitor.sv"
    `include "scoreboard.sv"
    `include "agent.sv"
    `include "enviornment.sv"
    `include "test.sv"

endpackage


module top;

    import uvm_pkg::*;
      import apb_pkg::*;

    bit clk = 0;
    logic rst;

    
    intf inf (
        .clk(clk),
        .rst(rst)
    );

    
    always #5 clk = ~clk;


   
    apb dut (
        .clk(inf.clk),
        .rst(inf.rst),
        .start(inf.start),
        .rw(inf.rw),
        .addr(inf.addr),
        .data(inf.data),
        .pready(inf.pready),
        .pslverr(inf.pslverr),
        .prdata(inf.prdata),
        .psel(inf.psel),
        .penable(inf.penable),
        .pwrite(inf.pwrite),
        .paddr(inf.paddr),
          .pwdata(inf.pwdata),
        .read_data(inf.read_data),
        .done(inf.done),
        .error(inf.error)
    );


    // APB Slave
    apb_slave slave (
          .clk(inf.clk),
        .rst(inf.rst),
            .psel(inf.psel),
        .penable(inf.penable),
        .pwrite(inf.pwrite),
          .paddr(inf.paddr),
        .pwdata(inf.pwdata),
         .pready(inf.pready),
          .pslverr(inf.pslverr),
        .prdata(inf.prdata)
    );


   
    initial begin
        rst = 1'b1;
        inf.start = 1'b0;
        inf.rw  = 1'b0;
        inf.addr = '0;
        inf.data = '0;

       
 repeat (5) @(posedge clk);
        @(negedge clk);
        rst = 1'b0;
    end


    
    initial begin
        $dumpfile("apb_dump.vcd");
        $dumpvars(0, top);
    end


 
    initial begin
        uvm_config_db#(virtual intf)::set(null, "*", "vif", inf);
        run_test("my_test");
    end

endmodule
