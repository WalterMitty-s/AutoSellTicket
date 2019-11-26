`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/23 15:35:58
// Design Name: 
// Module Name: clk_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div(
    clk,
    clk_sys
    );
    input clk;
    output clk_sys;
    
    reg clk_sys=0;
    reg [25:0] counter=0;
    
    always@(posedge clk)
    begin
        if(counter>=50000000)//50000000
        begin
            clk_sys=~clk_sys;
            counter<=0;
        end
        else
        begin
            counter<=counter+1;
        end
    end
    
endmodule
