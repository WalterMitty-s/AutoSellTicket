`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/27 19:43:31
// Design Name: 
// Module Name: money_scan_tb
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


module money_scan_tb;
    reg [7:0] money;
    reg [2:0] ticketType,ticketCount;
    reg [7:0] moneyReturn;
    reg rst;
    wire [3:0] d7,d6,d5,d4,d3,d2,d1,d0;
    
    money_scan money_scanex(
        .money(money),
        .ticketType(ticketType),
        .ticketCount(ticketCount),
        .moneyReturn(moneyReturn),
        .rst(rst),
//        .clke(clk),
        .d7(d7),
        .d6(d6),
        .d5(d5),
        .d4(d4),
        .d3(d3),
        .d2(d2),
        .d1(d1),
        .d0(d0)
        );
    initial
    begin
        rst=0;
//        clk=0;
    end
//    always
//    begin
//        clk=~clk;
        
//    end
    initial
    begin
        money=120;
        ticketType=0;
        ticketCount=3;
        moneyReturn=20;
        #30
        ticketType=1;
        #30 
        ticketType=2;
        #30
        ticketType=3;
    end
endmodule
