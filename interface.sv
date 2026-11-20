interface intf(input logic clk, input logic rst);
   
//     logic clk;
//     logic rst;
    logic start; 
    logic rw;
  logic [3:0] addr;
  logic [3:0] data;
    logic pready; 
    logic pslverr;
  logic [3:0] prdata;

    logic psel; 
    logic penable; 
    logic pwrite;
  logic [3:0] paddr; 
  logic [3:0] pwdata;
  logic [3:0] read_data;
    logic done;
    logic error;

  endinterface   
