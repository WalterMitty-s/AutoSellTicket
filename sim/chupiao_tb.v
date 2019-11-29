`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 23:42:28
// Design Name: 
// Module Name: chupiao_tb
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


module chupiao_tb;
    reg rst;
    reg clk;
    reg en;
    reg [2:0] ticket,count;
    wire co1,co2,co3,co4;
    chupiao chupiaoexample(
        .rst(rst),
        .clk(clk),
        .en(en),
        .ticket(ticket),
        .count(count),
        .co1(co1),
        .co2(co2),
        .co3(co3),
        .co4(co4)
        );
        
    initial
    begin
        clk=0;
        rst=0;
    end
    always
    begin
        #40
        clk=~clk;
    end
    initial
    begin
        en=0;
        #50
        en=1;
        #100
        en=0;
        #350
        en=1;
        #100
        en=0;
    end
    initial
    begin
        ticket=2;
        count=2;
    end
    initial
    begin
        #480
        ticket=3;
        count=3;
    end
    
endmodule
