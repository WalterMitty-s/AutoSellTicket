`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 22:54:17
// Design Name: 
// Module Name: chupiao
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


module chupiao(
    input rst,//复位信号 高电平有效
    input clk,//时钟信号
    input en,//使能端 为1时将票类型，数量输入，为0时出票
    input [1:0] ticket,//出票类型1,2,3
    input [1:0] count,//出票数量1,2,3
    output co1,//出票数量 一个脉冲一张票，1类型
    output co2,//2类型
    output co3,//3类型
    output co4//4类型
    );
    
    reg [3:0] q=4'b0000;//对应票型
    reg [1:0] ticketType;//票型
    reg [1:0] ticketCount;//票数
    
    always@(posedge clk,posedge rst,posedge en)
    begin
        if(rst==1)
        begin
            q<=0;
        end
        else if(en==1)
            begin
                q<=0;
                ticketType<=ticket;
                ticketCount<=count*2;
            end
        else 
        begin
            if(ticketType==0)
            begin
                if(ticketCount!=0)
                begin
                    q[0]=~q[0];
                    ticketCount=ticketCount-1;
                end
            end
            else if(ticketType==1)
                 begin
                    if(ticketCount!=0)
                    begin
                        q[1]=~q[1];
                        ticketCount=ticketCount-1;
                    end
                 end
            else if(ticketType==2)
                 begin
                    if(ticketCount!=0)
                    begin
                        q[2]=~q[2];
                        ticketCount=ticketCount-1;
                    end
                 end
             else
                  begin
                      if(ticketCount!=0)
                      begin
                          q[3]=~q[3];
                          ticketCount=ticketCount-1;
                      end
                  end
        end 
    end
    
    assign co1=q[0];
    assign co2=q[1];
    assign co3=q[2];
    assign co4=q[3];
    
endmodule
