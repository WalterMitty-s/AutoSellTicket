`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/21 16:50:29
// Design Name: 
// Module Name: control_tb
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


module control_tb;
    reg rst;
    reg clk;
    reg sure,nsure;
    reg [2:0] ticketType,ticketCount;
    reg [7:0] money;
    wire [7:0] moneyReturn;
    wire moneyFinish,ticketFinish;
    
    control controlexample(
        .rst(rst),
        .clk(clk),
        .sure(sure),
        .nsure(nsure),
        .ticketType(ticketType),
        .ticketCount(ticketCount),
        .money(money),
        .moneyReturn(moneyReturn),
        .moneyFinish(moneyFinish),
        .ticketFinish(ticketFinish)
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
        ticketType=3;
        ticketCount=3;
    end
    initial
    begin
        money=100;
    end
    initial
    begin
        sure=1;
        nsure=0;      
        #300
        sure=0;
        nsure=1;
    end
endmodule
