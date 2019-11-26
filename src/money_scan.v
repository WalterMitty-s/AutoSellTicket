`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/26 14:43:03
// Design Name: 
// Module Name: money_scan
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


module money_scan(
    input [7:0] money,//输入金额
    input [1:0] ticketType,ticketCount,//票的类型，价格    
    input [7:0] moneyReturn,//找零金额
    input rst,
    output [3:0] d7,d6,d5,d4,d3,d2,d1,d0//数码管显示数字
    );
    reg [3:0] dd7,dd6,dd5,dd4,dd3,dd2,dd1,dd0;
    
    always@(*)
    begin
        if(rst==1)
        begin
        dd7=0;
        dd6=0;
        dd5=0;
        dd4=0;
        dd3=0;
        dd2=0;
        dd1=0;
        dd0=0;
        end
        else
        begin
        dd7=money/50;
        dd6=(money-50*dd7)/10;
        dd5=money-50*dd7-10*dd6;
        
        dd3=ticketType*ticketCount;
        dd2=moneyReturn/50;
        dd1=(moneyReturn-50*dd2)/10;
        dd0=moneyReturn-50*dd2-10*dd1;
        end
    end
    
    assign d7=dd7;
    assign d6=dd6;
    assign d5=dd5;
    assign d4=dd4;
    assign d3=dd3;
    assign d2=dd2;
    assign d1=dd1;
    assign d0=dd0;
    
endmodule
