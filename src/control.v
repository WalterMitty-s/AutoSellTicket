`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/21 16:50:10
// Design Name: 
// Module Name: control
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


module control(
    input rst,//��λ�ź� �ߵ�ƽ��Ч
    input clk,//ʱ���ź�
    input sure,nsure,//ȷ����Ʊ ȡ����Ʊ
    input [1:0] ticketType,ticketCount,//Ʊ�����ͣ�Ʊ������
    input [7:0] money,//֧�����
    output reg [7:0] moneyReturn=0,//������
    output reg moneyFinish=0,ticketFinish=0//������ϣ���Ʊ���    
    );
    
    always@(posedge clk,posedge rst)
    begin
        if(rst==1)
        begin    
            moneyFinish<=0;
            ticketFinish<=0;
            moneyReturn<=0;
        end  
        else if( (sure==1)&&(money>=ticketType*ticketCount) )
                begin
                    moneyFinish<=1;
                    ticketFinish<=1;  
                    moneyReturn<=money-ticketType*ticketCount;      
                end
        else if( (nsure==1)||(money<ticketType*ticketCount) )
                begin
                    moneyFinish<=0;
                    ticketFinish<=0;
                    moneyReturn<=money;
                end
        else 
            begin
                moneyFinish<=0;
                ticketFinish<=0;
            end
    end
 
endmodule
