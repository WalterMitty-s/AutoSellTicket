`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/14 22:53:51
// Design Name: 
// Module Name: SellTicket
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


module SellTicket(
    input rst,//复位信号 高电平有效
    input clk_sys,//时钟信号
//    input clr,//清零信号
    input sure,nsure,//确认信号，取消信号
    input ci1,ci5,ci10,ci50,ci100,//输入金额统计
    input [2:0] ticketType,ticketCount,//出票类型，数量
    output qian1,qian5,qian10,qian50,//各个面值
    output co1,co2,co3,co4,//票的类型
    output [7:0] moneyReturn,//票价，票数
    output beep,//蜂鸣器
    output [7:0] an,sseg//数码管
    
    );
    
    wire [7:0] moneyin;//输入总金额
    wire [7:0] moneyout;//找零总金额
    wire moneyFinish,ticketFinish; 
    
   assign moneyReturn=moneyout;
    
    reg clk=0;
    reg [25:0] counter=0;

    always@(posedge clk_sys)
        begin
            if(counter>=50000000)//
                begin
                clk<=~clk;
                counter<=0;
                end
            else
                begin
                    counter<=counter+1;
                end
        end
        
    control controlmd(
        .rst(rst),
        .clk(clk_sys),//
        .sure(sure),
        .nsure(nsure),
        .ticketType(ticketType),
        .ticketCount(ticketCount),
        .money(moneyin),
        .moneyReturn(moneyout),
        .moneyFinish(moneyFinish),
        .ticketFinish(ticketFinish)
        );
        
    count countmd(
        .rst(rst),
//        .clr(moneyFinish),
        .ci1(ci1),
        .ci5(ci5),
        .ci10(ci10),
        .ci50(ci50),
        .ci100(ci100),
        .clk(clk_sys),//时钟
        .beep(beep),//蜂鸣器
        .cout(moneyin)
        );
        
    chupiao chupiaomd(
        .rst(rst),
        .clk(clk),
        .en(ticketFinish),
        .ticket(ticketType),
        .count(ticketCount),
        .co1(co1),
        .co2(co2),
        .co3(co3),
        .co4(co4)    
        );
    
    zhaoling zhaolingmd(
        .rst(rst),
        .clk(clk),
        .shift(moneyFinish),
        .money(moneyout),
        .qian1(qian1),
        .qian5(qian5),
        .qian10(qian10),
        .qian50(qian50)
        );
    
    ShuMaGuan shumaguanmd(
        .money(moneyin),
        .moneyReturn(moneyout),
        .ticketType(ticketType),
        .ticketCount(ticketCount),
        .rst(rst),
        .clk(clk_sys),
        .an(an),
        .sseg(sseg)
        );
        
endmodule
