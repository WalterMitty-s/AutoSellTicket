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
    input rst,//��λ�ź� �ߵ�ƽ��Ч
    input clk_sys,//ʱ���ź�
//    input clr,//�����ź�
    input sure,nsure,//ȷ���źţ�ȡ���ź�
    input ci1,ci5,ci10,ci50,ci100,//������ͳ��
    input [2:0] ticketType,ticketCount,//��Ʊ���ͣ�����
    output qian1,qian5,qian10,qian50,//������ֵ
    output co1,co2,co3,co4,//Ʊ������
    output [7:0] moneyReturn,//Ʊ�ۣ�Ʊ��
    output beep,//������
    output [7:0] an,sseg//�����
    
    );
    
    wire [7:0] moneyin;//�����ܽ��
    wire [7:0] moneyout;//�����ܽ��
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
        .clk(clk_sys),//ʱ��
        .beep(beep),//������
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
