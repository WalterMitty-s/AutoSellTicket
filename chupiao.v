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
    input rst,//��λ�ź� �ߵ�ƽ��Ч
    input clk,//ʱ���ź�
    input en,//ʹ�ܶ� Ϊ1ʱ��Ʊ���ͣ��������룬Ϊ0ʱ��Ʊ
    input [1:0] ticket,//��Ʊ����1,2,3
    input [1:0] count,//��Ʊ����1,2,3
    output co1,//��Ʊ���� һ������һ��Ʊ��1����
    output co2,//2����
    output co3,//3����
    output co4//4����
    );
    
    reg [3:0] q=4'b0000;//��ӦƱ��
    reg [1:0] ticketType;//Ʊ��
    reg [1:0] ticketCount;//Ʊ��
    
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
