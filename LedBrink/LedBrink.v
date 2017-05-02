`timescale 1ns / 1ps

module LedBrink(
    input CLK20MHZ,
    output CLKOUT
);

    reg [20:0] count;
    reg out;

    always @(posedge CLK20MHZ) begin
        if (count[20:0] == 2000000) begin
            count[20:0] <= 0;
            out <= ~out;
		  end else begin
		      count[20:0] <= count[20:0] + 1;
        end
    end

    assign CLKOUT = out;

endmodule
