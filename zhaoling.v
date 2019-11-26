`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 23:27:58
// Design Name: 
// Module Name: zhaoling
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


module zhaoling(
    input rst,//��λ�ź� �ߵ�ƽ��Ч
    input clk,//ʱ���ź�
    input shift,//���ƽ�����
    input [7:0] money,//�����ܽ��
    output qian1,qian5,qian10,qian50//������ֵ��������
    );
    
    reg [3:0] q=0;
    reg [3:0] q1=0,q5=0,q10=0,q50=0;
   
    always@(posedge clk,posedge rst,posedge shift)
    begin
        
        if(rst==1)
            q<=0;//��λ
        else if(shift==1)
            begin
                q50=money/50;//50�������
                q10=(money-50*q50)/10;//
                q5=(money-50*q50-10*q10)/5;
                q1=(money-50*q50-10*q10-5*q5);
                q50=2*q50;
                q10=2*q10;
                q5=2*q5;
                q1=2*q1;   
            end  
       else
       begin
            if(q50!=0)
                begin
                    q[3]=~q[3];//һ�����ڱ�ʾһ��
                    q50=q50-1;
                end
            else if(q10!=0)
                begin
                    q[2]=~q[2];
                    q10=q10-1;
                end
            else if(q5!=0)
                begin
                    q[1]=~q[1];
                    q5=q5-1;
                end
            else if(q1!=0)
                begin
                    q[0]=~q[0];
                    q1=q1-1;
                end
            else 
            begin
                q<=0;
            end
       end  
    end
    
    assign qian50=q[3];
    assign qian10=q[2];
    assign qian5=q[1];
    assign qian1=q[0];
    
endmodule
