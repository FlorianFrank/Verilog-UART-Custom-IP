`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Passau
// Engineer: Florian Frank
// 
// Create Date:    11:04:36 04/09/2022 
// Module Name:    UART_top_module 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module test_bench ();

  parameter BAUDRATE = 50000000;
  parameter STOPBITS = 1;
  parameter PARITY = 0;  // EVEN
  parameter DATA_LENGTH = 8;
  
  reg clk, start;
  reg [7:0] value;
  wire rx, tx, active, ready;
  

  initial begin
    clk   <= 0;
    value <= 8'hC5;
    start <= 0;
    #50000 $stop;
  end

  initial begin
    forever #2 clk = ~clk;
  end

  
    always @(posedge clk) begin
    if (active == 0) start <= 1;
    else start <= 0;
  end

  UART_top_module #(
      .BAUDRATE(BAUDRATE),
      .STOPBITS(STOPBITS),
      .PARITY(PARITY),
      .DATA_LENGTH(DATA_LENGTH)
  ) test_module (
      .value(value),
      .start_signal(start),
      .clk_100MHZ(clk),
      .UartRx(rx),
      .UartTx(tx),
      .active(active),
      .ready(ready)
  );

endmodule
