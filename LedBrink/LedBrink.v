/////////////////////////////////////////////////////////////////////////////////////////////////
//
// LedBrink - Sample for Spartan2Bone
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
