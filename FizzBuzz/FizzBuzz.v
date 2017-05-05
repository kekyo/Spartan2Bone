/////////////////////////////////////////////////////////////////////////////////////////////////
//
// FizzBuzz - Sample for Spartan2Bone
// Copyright (c) 2017 Kouji Matsui (@kekyo2)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//	http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
/////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module FizzBuzz(
	input CLK20MHz,
	output [7:0] LED0,
	output [7:0] LED1,
	output FIZZ,
	output BUZZ
);
	
	function [7:0] LedEncoder;
		input [3:0] value;
		begin
			// FGABPCDE
			case (value)
				4'b0000 : LedEncoder = 8'b10110111;
				4'b0001 : LedEncoder = 8'b00010100;
				4'b0010 : LedEncoder = 8'b01110011;
				4'b0011 : LedEncoder = 8'b01110110;
				4'b0100 : LedEncoder = 8'b11010100;
				4'b0101 : LedEncoder = 8'b11100110;
				4'b0110 : LedEncoder = 8'b11100111;
				4'b0111 : LedEncoder = 8'b10110100;
				4'b1000 : LedEncoder = 8'b11110111;
				4'b1001 : LedEncoder = 8'b11110110;
				4'b1010 : LedEncoder = 8'b11110101;
				4'b1011 : LedEncoder = 8'b11000111;
				4'b1100 : LedEncoder = 8'b10100011;
				4'b1101 : LedEncoder = 8'b01010111;
				4'b1110 : LedEncoder = 8'b11100011;
				4'b1111 : LedEncoder = 8'b11100001;
			endcase
		end
	endfunction

   reg [20:0] divider;
   reg [7:0] count;
	reg [1:0] fizzCount;
	reg [2:0] buzzCount;
	
	always @(posedge CLK20MHz) begin
		divider <= divider + 1;
	end
	
	always @(posedge divider[20]) begin
		count <= count + 1;
	end
	
	always @(posedge divider[20]) begin
		if (fizzCount == 2'b11) begin
			fizzCount <= 1;
		end else begin
			fizzCount <= fizzCount + 1;
		end
	end
	
	always @(posedge divider[20]) begin
		if (buzzCount == 3'b101) begin
			buzzCount <= 1;
		end else begin
			buzzCount <= buzzCount + 1;
		end
	end
	
	assign LED0 = LedEncoder(count[3:0]);
	assign LED1 = LedEncoder(count[7:4]);
	assign FIZZ = fizzCount == 2'b11;
	assign BUZZ = buzzCount == 3'b101;

endmodule
