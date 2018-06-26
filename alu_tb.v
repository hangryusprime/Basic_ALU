`timescale 1ns / 1ps

module alu_tb;

	// Inputs
	reg [11:0] a;
	reg [11:0] b;
	reg [3:0] sel;

	// Outputs
	wire agrtb;
	wire altb;
	wire aeqb;
	wire [11:0] result;
	
	// variable
	integer i;

	// Instantiate the Unit Under Test (UUT)
	alu_a5 uut (
		.a(a), 
		.b(b), 
		.sel(sel), 
		.agrtb(agrtb), 
		.altb(altb), 
		.aeqb(aeqb), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		sel = 0;
		i = 3'b0;
		// Add stimulus here
      $monitor(sel);
        for (i=0; i<16; i=i+1) begin
            sel = i;
				a = i*i + i*5 - 5'd31 ;
				b = i*i - i*2 - 5'd12;
            #60;
        end
	end 
endmodule

