`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/29 19:11:37
// Design Name: 
// Module Name: Music_tb
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


module Music_tb;
    reg key;
    reg clk;
    wire beep;
    
    Music musicexample(
        .key(key),
        .clk(clk),
        .beep(beep)
        );
    
    initial
    begin
        clk=0;
    end 
    initial
    begin
        key=0;
    end
    initial
    begin
        key=1;
        #50
        key=0;
    end
    always
    begin
        #20
        clk=~clk;
    end
    
endmodule
