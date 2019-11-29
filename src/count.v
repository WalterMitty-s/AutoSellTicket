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

//ͨ��������ֵ�������������м���
module count(
    input rst,//�����ź� �ߵ�ƽ��Ч
//    input clr,//�����ź� �ߵ�ƽ��Ч
    input ci1,//1Ԫ��5Ԫ��10Ԫ��50Ԫ��100Ԫ
    input ci5,
    input ci10,
    input ci50,
    input ci100,
    input clk,//ʱ��   
    output beep,//������
    output [7:0] cout//�ܽ��
 
    );
    
    reg [3:0] q1=0,q5=0,q10=0,q50=0,q100=0;//����ֵǮ����
    
    always@(posedge rst,posedge ci1)//ͳ��1Ԫ
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
    
    always@(posedge rst,posedge ci5)//ͳ��5Ԫ
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
    
    always@(posedge rst,posedge ci10)//ͳ��10Ԫ
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
    
    always@(posedge rst,posedge ci50)//ͳ��50Ԫ
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
    
    always@(posedge rst,posedge ci100)//ͳ��100Ԫ
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
