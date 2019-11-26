`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/26 14:39:26
// Design Name: 
// Module Name: ShuMaGuan
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


module ShuMaGuan(
    input [7:0] money,//输入金额
    input [7:0] moneyReturn,//找零金额
    input [1:0] ticketType,ticketCount,//票的类型，数量
    input rst,
    input clk,//时钟
    output [7:0] an,//数码管显示某一个
    output [7:0] sseg//七段显示某一个
    );
    wire [3:0] d7,d6,d5,d3,d2,d1,d0;
    
    money_scan money_scanexample(
        .money(money),
        .ticketType(ticketType),
        .ticketCount(ticketCount),
        .moneyReturn(moneyReturn),
        .rst(rst),
        .d7(d7),
        .d6(d6),
        .d5(d5),
        .d4(d4),
        .d3(d3),
        .d2(d2),
        .d1(d1),
        .d0(d0)
        );
    
    seven_scan seven_scanexample(
        .hex7(d7),
        .hex6(d6),
        .hex5(d5),
        .hex4(d4),
        .hex3(d3),
        .hex2(d2),
        .hex1(d1),
        .hex0(d0),
        .rst(rst),
        .clk(clk),
        .dp_in(8'b11010110),
        .an(an),
        .sseg(sseg)
        );
    
endmodule
