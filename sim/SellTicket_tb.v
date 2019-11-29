`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/23 09:54:23
// Design Name: 
// Module Name: SellTicket_tb
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


module SellTicket_tb;
    reg rst;
    reg clk;
    reg sure,nsure;
    reg ci1,ci5,ci10,ci50,ci100;
    reg [2:0] ticketType,ticketCount;
    
    wire qian1,qian5,qian10,qian50;
    wire co1,co2,co3,co4;
    wire [7:0] moneyReturn;
    wire beep;
    
    SellTicket SellTicketexample(
        .rst(rst),
        .clk_sys(clk),//clk_sys
        .sure(sure),
        .nsure(nsure),
        .ci1(ci1),
        .ci5(ci5),
        .ci10(ci10),
        .ci50(ci50),
        .ci100(ci100),
        .ticketType(ticketType),
        .ticketCount(ticketCount),
        .qian1(qian1),
        .qian5(qian5),
        .qian10(qian10),
        .qian50(qian50),
        .co1(co1),
        .co2(co2),
        .co3(co3),
        .co4(co4),
        .beep(beep),//
        .moneyReturn(moneyReturn)
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
        sure=1;
        nsure=0;
        #200
        sure=0;
        nsure=0;
    end
    initial
    begin
        ci1=0;
        ci5=0;
        ci10=0;
        ci50=0;
        ci100=0;
        #20
        ci1=1;
        ci5=1;
        ci10=1;
        ci50=0;
        ci100=1; 
    end
    initial
    begin
        ticketType=3'b011;
        ticketCount=3'b011;
    end

endmodule
