`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/14 22:56:28
// Design Name: 
// Module Name: count
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

//通过各个面值的上升沿来进行计数
module count(
    input rst,//重置信号 高电平有效
//    input clr,//清零信号 高电平有效
    input ci1,//1元，5元，10元，50元，100元
    input ci5,
    input ci10,
    input ci50,
    input ci100,
    input clk,//时钟   
    output beep,//蜂鸣器
    output [7:0] cout//总金额
 
    );
    
    reg [3:0] q1=0,q5=0,q10=0,q50=0,q100=0;//各面值钱数量
    
    always@(posedge rst,posedge ci1)//统计1元
    begin
        if(rst==1)
            q1<=0;
//        else if(clr==1)
//            q1<=0;
        else
        begin
            q1=q1+1;
        end
    end 
    
    always@(posedge rst,posedge ci5)//统计5元
    begin
        if(rst==1)
            q5<=0;
//        else if(clr==1)
//            q5<=0;
        else
        begin
            q5<=q5+1;
        end
    end 
    
    always@(posedge rst,posedge ci10)//统计10元
    begin
        if(rst==1)
            q10<=0;
//        else if(clr==1)
//            q10<=0;
        else
        begin
            q10<=q10+1;
        end
    end 
    
    always@(posedge rst,posedge ci50)//统计50元
    begin
        if(rst==1)
            q50<=0;
//        else if(clr==1)
//            q50<=0;
        else
        begin
            q50<=q50+1;
        end
    end 
    
    always@(posedge rst,posedge ci100)//统计100元
    begin
        if(rst==1)
            q100<=0;
//        else if(clr==1)
//            q100<=0;
        else
        begin 
            q100<=q100+1;
        end
    end 
    
    assign cout=q1 + 5*q5 + 10*q10 + 50*q50 + 100*q100;
    assign key=ci1|ci5|ci10|ci50|ci100;
    
    Music musicmd(
        .key(key),
        .clk(clk),
        .beep(beep)
        );
endmodule
