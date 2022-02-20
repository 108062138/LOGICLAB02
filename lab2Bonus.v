`timescale 1ns/1ps

module BullsAndCows (
input wire [7:0]leftPlayer,
input wire [7:0]rightPlayer,
output wire [7:0]SSD,
output wire [3:0]d
);

wire [3:0] left0;
wire [3:0] left1;
wire [3:0] right0;
wire [3:0] right1;
reg  [1:0] guessBin;
wire [3:0] complete;

assign complete[3:2] = 2'b00;
assign complete[1:0] = guessBin;
assign left1 = leftPlayer[7:4];
assign left0 = leftPlayer[3:0];
assign right1 = rightPlayer[7:4];
assign right0 = rightPlayer[3:0];
/////////////////////////////////////////
//////
////// left1 left0 right1 right0
////// 
/////////////////////////////////////////
always @(*) begin
    if(left1 === right1)begin
        if(left0===right0)begin
            guessBin = 2'b11;
        end else begin
            guessBin = 2'b01;
        end
    end else begin //left1 !== right1
        if(left2===right2)begin
            guessBin = 2'b01;
        end else begin
            guessBin = 2'b00;
        end
    end
end

sevenSegment DEMO(
.i(complete),
.SSD(SSD),
.d(d)
);

endmodule