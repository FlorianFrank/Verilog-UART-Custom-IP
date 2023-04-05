`timescale 1ns / 1ps
//% \addtogroup clock Clocking
//% @{


module clk_divider 

		#(parameter DIVIDER1=4, 
		  parameter DIVIDER2=4, 
		  parameter BASE_FREQUENCY=100, 
		  parameter PHASE_SHIFT=0)(
		
		// 100 MHZ input clock
		input clk_in, 
		// First output clock
		output reg clk_out1,
		// Inverse of first output clock
		output reg clk_out1_inv,
		// Second output clock
		output reg clk_out2,
		// Inverse of second output clock
		output reg clk_out2_inv,
		// LOCKED indicates that the PLL has stabalized and returns a stable and reliable signal.
		output wire LOCKED);

		
		// Counter for second clock and inverse of the second clock
		integer ctr1 = 0;
		// Counter for first clock and inverse of the first clock
		integer ctr2 = 0;

	// Task sets the first clock and its inverse bassed on the output frequency of the PLL and the selected DIVIDER1.
	task inc_divider1;
	begin
		if(DIVIDER1 == 0)
			begin
			clk_out1 <= ~clk_out1;
			clk_out1_inv <= ~clk_out1_inv;
			end
		else
		begin
			if(ctr1 < DIVIDER1 - 3)
				ctr1  <= ctr1 + 1;
			else begin
				ctr1  <= 0;
				clk_out1 <= ~clk_out1;
				clk_out1_inv <= ~clk_out1_inv;
			end
		end
	end
	endtask
	
	
	// Task sets the second clock and its inverse bassed on the output frequency of the PLL and the selected DIVIDER2.
	task inc_divider2;
	begin
		if(DIVIDER2 == 0)
			begin
			clk_out2 <= ~clk_out2;
			clk_out2_inv <= ~clk_out2_inv;
			end
		else
		begin
			if(ctr2 < DIVIDER2 - 3)
			begin
				ctr2  <= ctr2 + 1;
			end
			else begin
				ctr2  <= 0;
				clk_out2 <= ~clk_out2;
				clk_out2_inv <= ~clk_out2_inv;
			end
		end
	end
	endtask
	
	
	initial begin
		clk_out1 <= 0;
		clk_out1_inv <= 1;
		clk_out2 <= 0;
		clk_out2_inv <= 1;
	end
	
	always @ (posedge clk_in) begin
		inc_divider1();
		inc_divider2();
	end

    assign LOCKED = 1;

endmodule
//% @}