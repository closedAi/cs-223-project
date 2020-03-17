`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2019 03:03:03 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk, //100Mhz on Basys3
	input logic [15:12] num,
	input logic [10:8] numControl,
	//7-segment signals
	output a, b, c, d, e, f, g, dp, 
    output [3:0] an
    );

    //4 numbers to keep value of any of 4 digits
    //user's hex inputs for 4 digits
    logic [3:0] in0 = 4'h0; //initial value
    logic [3:0] in1 = 4'h0; //initial value
    logic [3:0] in2 = 4'h0; //initial value
    logic [3:0] in3 = 4'h0; //initial value
    
    // this module shows 4 hexadecimal numbers on 4-digit 7-Segment.  
    // 4 digits are scanned with high speed, then you do not notice that every time 
    // only one of them is ON. dp is always off.
    sevenSegment sevenSegmentInstance(
        .clk(clk),
        .in3(in3), .in2(in2), .in1(in1), .in0(in0), //user inputs for each digit (hexadecimal)
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp), // just connect them to FPGA pins (individual LEDs).
        .an(an)   // just connect them to FPGA pins (enable vector for 4 digits active low) 
    );
    
        
    // run an example function for each key of keypad.
    always@ (posedge clk)
    if (numControl[10] == 1'b1) begin
        if(numControl[9:8] == 2'b00)begin
            case(num[15:12])
            4'b00_00:
                in0 = 4'd0;
            4'b00_01:  
                in0 = 4'd1;
    
            4'b00_10:  
                in0 = 4'd2;
        
            4'b00_11:  
                in0 = 4'd3;
        
            4'b01_00:  
                in0 = 4'd4;	
                
            4'b01_01:  
                in0 = 4'd5;
                
            4'b01_10: 
                in0 = 4'd6;
                
            4'b01_11:  
                in0 = 4'd7;		
                
            4'b10_00:  
                in0 = 4'd8;
        
            4'b10_01:  
                in0 = 4'd9;
        
            4'b10_10:  
                in0 = 4'd10;
        
            4'b10_11:  
                in0 = 4'd11;	
                
            4'b11_00:  
                in0 = 4'd12;
        
            4'b11_01:  
                in0 = 4'd13;	
        
            4'b11_10:  
                in0 = 4'd14;
        
            4'b11_11:  
                in0 = 4'd15;		
            endcase
        end
        
    if(numControl[9:8] == 2'b01)begin
            case(num[15:12])
            4'b00_00:
                in1 = 4'd0;
            4'b00_01:  
                in1 = 4'd1;
    
            4'b00_10:  
                in1 = 4'd2;
        
            4'b00_11:  
                in1 = 4'd3;
        
            4'b01_00:  
                in1 = 4'd4;	
                
            4'b01_01:  
                in1 = 4'd5;
                
            4'b01_10: 
                in1 = 4'd6;
                
            4'b01_11:  
                in1 = 4'd7;		
                
            4'b10_00:  
                in1 = 4'd8;
        
            4'b10_01:  
                in1 = 4'd9;
        
            4'b10_10:  
                in1 = 4'd10;
        
            4'b10_11:  
                in1 = 4'd11;	
                
            4'b11_00:  
                in1 = 4'd12;
        
            4'b11_01:  
                in1 = 4'd13;	
        
            4'b11_10:  
                in1 = 4'd14;
        
            4'b11_11:  
                in1 = 4'd15;		
            endcase
        end
        
        if(numControl[9:8] == 2'b10)begin
            case(num[15:12])
            4'b00_00:
                in2 = 4'd0;
            4'b00_01:  
                in2 = 4'd1;
    
            4'b00_10:  
                in2 = 4'd2;
        
            4'b00_11:  
                in2 = 4'd3;
        
            4'b01_00:  
                in2 = 4'd4;	
                
            4'b01_01:  
                in2 = 4'd5;
                
            4'b01_10: 
                in2 = 4'd6;
                
            4'b01_11:  
                in2 = 4'd7;		
                
            4'b10_00:  
                in2 = 4'd8;
        
            4'b10_01:  
                in2 = 4'd9;
        
            4'b10_10:  
                in2 = 4'd10;
        
            4'b10_11:  
                in2 = 4'd11;	
                
            4'b11_00:  
                in2 = 4'd12;
        
            4'b11_01:  
                in2 = 4'd13;	
        
            4'b11_10:  
                in2 = 4'd14;
        
            4'b11_11:  
                in2 = 4'd15;		
            endcase
        end
        
        if(numControl[9:8] == 2'b11)begin
            case(num[15:12])
            4'b00_00:
                in3 = 4'd0;
            4'b00_01:  
                in3 = 4'd1;
    
            4'b00_10:  
                in3 = 4'd2;
        
            4'b00_11:  
                in3 = 4'd3;
        
            4'b01_00:  
                in3 = 4'd4;	
                
            4'b01_01:  
                in3 = 4'd5;
                
            4'b01_10: 
                in3 = 4'd6;
                
            4'b01_11:  
                in3 = 4'd7;		
                
            4'b10_00:  
                in3 = 4'd8;
        
            4'b10_01:  
                in3 = 4'd9;
        
            4'b10_10:  
                in3 = 4'd10;
        
            4'b10_11:  
                in3 = 4'd11;	
                
            4'b11_00:  
                in3 = 4'd12;
        
            4'b11_01:  
                in3 = 4'd13;	
        
            4'b11_10:  
                in3 = 4'd14;
        
            4'b11_11:  
                in3 = 4'd15;		
            endcase
        end
    end//outer if
endmodule