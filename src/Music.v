`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/29 18:51:37
// Design Name: 
// Module Name: Music
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


module Music(
    input key,
    input clk,
    output reg beep
    );
    reg [15:0] cnt=16'b0; 
    
    always@(posedge clk)
    begin
        if(key==1'b0)
        begin
            beep<=1'b0;
            cnt<=16'b0;
        end
        else
        begin
            if(cnt>40000)
            begin//
                beep<=~beep;
                cnt<=0;
            end
            else 
            begin
                cnt<=cnt+1;
            end
        end
    end
    
endmodule
