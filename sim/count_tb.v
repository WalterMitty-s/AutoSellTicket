`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/14 23:22:18
// Design Name: 
// Module Name: count_tb
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


module count_tb;
    reg rst;
    reg ci1;
    reg ci5;
    reg ci10;
    reg ci50;
    reg ci100;
    wire [7:0] cout;
    
    count countexample(
        .rst(rst),
        .ci1(ci1),
        .ci5(ci5),
        .ci10(ci10),
        .ci50(ci50),
        .ci100(ci100),
        .cout(cout)
        );
        
    initial
    begin
        rst=0;
        #10
        rst=1;
        #20
        rst=0;
    end
    
    initial
    begin
        ci1=0;
        #40
        ci1=1;

    end
    initial
    begin
        ci5=0;
        #80
        ci5=1;
    end
    initial
    begin
        ci10=0;
        #120
        ci10=1;
    end
    initial
    begin
        ci50=0;
        #160
        ci50=1;
    end
    initial
    begin
        ci100=0;
        #200
        ci100=1;
    end
endmodule
