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
module UART_top_module #(
    parameter BASE_FREQUENCY = 100000000,
    parameter BAUDRATE = 9600,
    parameter DATA_LENGTH = 8,
    parameter STOPBITS = 1,
    parameter PARITY = 0
) (
    input wire [7:0] value,
    input wire start_signal,
    input wire clk_100MHZ,
    input wire UartRx,
    output wire UartTx,
    output reg active,
    output reg ready
);

  parameter IDLE_CYCLES = 100;

  // Send the start signal indicating the UART module to send the data.
  parameter START_SENDING = 0;
  // Wait for the UART module to be finished after sending the stop bit.
  parameter WAIT_FOR_FINISHED_HIGH = 1;
  // Wait for the UART module to lower the finished signal indicating that a new value can be written.
  parameter WAIT_FOR_FINISHED_LOW = 2;
  // Wait some clock cycles after the write operation to write the next value.
  parameter IDLE = 3;

  // Set signal to signal the UART module to send data.
  reg start_sending;
  // Signal indicates that last send operation was finished.
  wire submodule_active;
  // 8 Bit value which should be transmitted.
  reg [7:0] value_reg;

  // Current state of the state machine.
  reg [3:0] current_state;

  // Counter to count the number of cycles when sending the start signal. 
  // This is required to match the differences in the different clocks.
  integer start_ctr;


  parameter UART_CYCLE = (BASE_FREQUENCY / BAUDRATE) * 2;


  UART_Module #(
      .BASE_FREQUENCY_MHZ(BASE_FREQUENCY / 1000000),
      .BAUDRATE(BAUDRATE),
      .STOPBITS(STOPBITS),
      .PARITY(PARITY),
      .DATA_LENGTH(DATA_LENGTH)
  ) uart_module (
      .clk_in(clk_100MHZ),
      .rx(UartRx),
      .tx(UartTx),
      .data(value_reg),
      .start(start_sending),
      .active(submodule_active)
  );

  initial begin
    start_sending <= 0;
    value_reg <= 0;
    current_state <= 0;
    start_ctr <= 0;
  end


  always @(posedge clk_100MHZ) begin
    case (current_state)

      START_SENDING: begin
        ready  <= 0;
        active <= 0;
        if (start_signal == 1) begin
          value_reg <= value;
          start_sending <= 1;
          current_state <= WAIT_FOR_FINISHED_HIGH;
        end
      end

      WAIT_FOR_FINISHED_HIGH: begin
        active <= 1;
        if (submodule_active == 1) begin
          start_sending <= 0;
          current_state <= WAIT_FOR_FINISHED_LOW;
        end
      end

      WAIT_FOR_FINISHED_LOW: begin
        if (submodule_active == 0) begin
          current_state <= IDLE;
        end
      end

      IDLE: begin
        active <= 0;
        ready <= 1;
        current_state <= 0;
      end

    endcase
  end


endmodule