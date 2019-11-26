`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/23 15:42:38
// Design Name: 
// Module Name: seven_scan
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


    module seven_scan(
        input rst,clk,
        input [3:0] hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7,//需要显示的数字
        input [7:0] dp_in,//点的显示
        output reg [7:0] an,//数码管是否点亮
        output reg [7:0] sseg
        );
        
        reg [19:0] count=0;
        reg dp;
        reg [3:0] hex;
        
        always@(posedge clk)
        begin
            if(rst)
            begin
                count<=0;
                hex<=4'd10;
            end
            else
            begin
                count=count+1;
                case(count[19:17])
                3'b000:
                    begin
                        hex=hex0;
                        an=8'b11111110;
                        dp=dp_in[0];
                    end
                3'b001:
                    begin
                        hex=hex1;
                        an=8'b11111101;
                        dp=dp_in[1];
                    end
                3'b010:
                    begin
                        hex=hex2;
                        an=8'b11111011;
                        dp=dp_in[2];
                    end
                3'b011:
                    begin
                        hex=hex3;
                        an=8'b11110111;
                        dp=dp_in[3];
                    end
                3'b100:
                    begin
                        hex=hex4;
                        an=8'b11101111;
                        dp=dp_in[4];
                    end
                3'b101:
                    begin
                        hex=hex5;
                        an=8'b11011111;
                        dp=dp_in[5];
                    end
                3'b110:
                    begin
                        hex=hex6;
                        an=8'b10111111;
                        dp=dp_in[6];
                    end
                3'b111:
                    begin
                        hex=hex7;
                        an=8'b01111111;
                        dp=dp_in[7];    
                    end
                default:
                    begin
                        count=0;
                    end
                endcase
            end
        end
        
        always@(*)
        begin
            case(hex)
            4'h0:sseg[6:0] = 7'b0000001;
            4'h1:sseg[6:0] = 7'b1001111;
            4'h2:sseg[6:0] = 7'b0010010;
            4'h3:sseg[6:0] = 7'b0000110;
            4'h4:sseg[6:0] = 7'b1001100;
            4'h5:sseg[6:0] = 7'b0100100;
            4'h6:sseg[6:0] = 7'b0100000;
            4'h7:sseg[6:0] = 7'b0001111;
            4'h8:sseg[6:0] = 7'b0000000;
            4'h9:sseg[6:0] = 7'b0000100;
            default: sseg[6:0] = 7'b0000001;
            endcase
            sseg[7]= dp;
        end
    endmodule
