`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/23 20:52:47
// Design Name: 
// Module Name: clk_div_tb
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


module clk_div_tb;
    reg clk;
    wire clk_sys;
    
    clk_div clk_divexample(
        .clk(clk),
        .clk_sys(clk_sys)
        );
        
    initial
    begin
        clk=0;
    end
    always
    begin
        #20
        clk=~clk;
    end
endmodule
