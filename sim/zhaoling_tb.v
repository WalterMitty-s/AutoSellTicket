`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 23:28:28
// Design Name: 
// Module Name: zhaoling_tb
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


module zhaoling_tb;
    reg rst;
    reg clk;
    reg shift;
    reg [7:0] money;
    wire qian1,qian5,qian10,qian50;
    
    zhaoling zhaolingexample(
        .rst(rst),
        .clk(clk),
        .shift(shift),
        .money(money),
        .qian1(qian1),
        .qian5(qian5),
        .qian10(qian10),
        .qian50(qian50)
        );
        
     initial
     begin
        rst=0;
        clk=0;
     end
     always
     begin
        #20
        clk=~clk;
     end
     initial
     begin
        shift=1;
        #50
        shift=0;
        
     end
     initial
     begin
        money=117;
     end
     
    
endmodule
