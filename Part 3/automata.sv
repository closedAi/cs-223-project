`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2019 08:53:54 PM
// Design Name: 
// Module Name: automata
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


module automata(
    input [63:0] memoryIn,
    //input [4:0] buttonIn,//[4] central [3] L [2] T [1] R [0] D
    input logic btnC,
    input logic btnD,
    input logic btnU,
    input logic btnL,
    input logic btnR,
    input clk,
    output [4:0] clickCount,
    output [63:0] memoryOut
    );
    logic [63:0]initMem;
    logic [63:0]tempMem;
    //logic [4:0] localCounter = 4'b0000;
    always@ (posedge clk)begin
       static int localCounter = 0;
       if(btnC == 1'b1)begin
            if(localCounter == 0)begin
                initMem = memoryIn;
                localCounter = 1;
            end
            else begin
                tempMem = initMem;
                localCounter = 0;
            end
        end
    
        else if((btnU == 1'b0) && (btnR == 1'b0) && (btnD == 1'b0) && (btnL == 1'b0) )begin
            tempMem = memoryIn;
        end
        else begin
        //middle inner square
        for (int j=0,i=9; i<63; i++) begin
            //for ensure loops in inner square
            if((j+1)%8 == 0)begin
                j = j+2;
                i = i+2;
            end
            //if top and left is on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if top right and bottom on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i-1] == 1'b1)&&(memoryIn[i+8] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if right and left is on
            if((memoryIn[i-1] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
        end
        //outer top
        for (int i=1; i<7; i++) begin
            //if top and left is on
            if((memoryIn[i+56] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if top right and bottom on
            if((memoryIn[i+56] == 1'b1)&& (memoryIn[i-1] == 1'b1)&&(memoryIn[i+8] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if right and left is on
            if((memoryIn[i-1] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
        end
        //outer Right
        for (int i=8; i<63; i = i+8) begin
            //if top and left is on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if top right and bottom on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i+7] == 1'b1)&&(memoryIn[i+8] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if right and left is on
            if((memoryIn[i+7] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
        end
        //outer bottom
        for (int i=57; i<63; i++) begin
            //if top and left is on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if top right and bottom on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i-1] == 1'b1)&&(memoryIn[i-56] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if right and left is on
            if((memoryIn[i-1] == 1'b1)&& (memoryIn[i+1] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
        end
        //outer left
        for (int i=15; i<63; i = i+8) begin
            //if top and left is on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i-7] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if top right and bottom on
            if((memoryIn[i-8] == 1'b1)&& (memoryIn[i-1] == 1'b1)&&(memoryIn[i+8] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
            //if right and left is on
            if((memoryIn[i-1] == 1'b1)&& (memoryIn[i-7] == 1'b1))begin
                tempMem[i] = 1'b1;
            end
        end
        // R T edge ---------------------------------------------------------------------------------------------------------
        //if top and left is on
        if((memoryIn[56] == 1'b1) && (memoryIn[1] == 1'b1))begin 
            tempMem[0] = 1'b1;
        end
        //if top right and bottom on
        if((memoryIn[56] == 1'b1)&&(memoryIn[7] == 1'b1) && (memoryIn[8] == 1'b1))begin 
            tempMem[0] = 1'b1;
        end
        //if right and left is on
        if((memoryIn[7] == 1'b1) && (memoryIn[1] == 1'b1))begin 
            tempMem[0] = 1'b1;
        end
        // L T edge ---------------------------------------------------------------------------------------------------------
        //if top and left is on
        if((memoryIn[63] == 1'b1) && (memoryIn[0] == 1'b1))begin 
            tempMem[7] = 1'b1;
        end
        //if top right and bottom on
        if((memoryIn[63] == 1'b1)&&(memoryIn[6] == 1'b1) && (memoryIn[15] == 1'b1))begin 
            tempMem[7] = 1'b1;
        end
        //if right and left is on
        if((memoryIn[6] == 1'b1) && (memoryIn[0] == 1'b1))begin 
            tempMem[7] = 1'b1;
        end
        // L B edge ---------------------------------------------------------------------------------------------------------
        //if top and left is on
        if((memoryIn[55] == 1'b1) && (memoryIn[56] == 1'b1))begin 
            tempMem[63] = 1'b1;
        end
        //if top right and bottom on
        if((memoryIn[55] == 1'b1)&&(memoryIn[62] == 1'b1) && (memoryIn[7] == 1'b1))begin 
            tempMem[63] = 1'b1;
        end
        //if right and left is on
        if((memoryIn[62] == 1'b1) && (memoryIn[56] == 1'b1))begin 
            tempMem[63] = 1'b1;
        end
        //R B edge ---------------------------------------------------------------------------------------------------------
        //if top and left is on
        if((memoryIn[48] == 1'b1) && (memoryIn[57] == 1'b1))begin 
            tempMem[56] = 1'b1;
        end
        //if top right and bottom on
        if((memoryIn[48] == 1'b1)&&(memoryIn[63] == 1'b1) && (memoryIn[0] == 1'b1))begin 
            tempMem[56] = 1'b1;
        end
        //if right and left is on
        if((memoryIn[63] == 1'b1) && (memoryIn[57] == 1'b1))begin 
            tempMem[56] = 1'b1;
        end

            if(btnU == 1'b1)begin
                tempMem = tempMem & 64'b10101010_00000000_10101010_00000000_01011010_00000000_01011010_00000000;
                localCounter++;
                //tempMem = 64'b1111111111111111111111111111111111111111111111111111111111111111;
            end
            if(btnR == 1'b1)begin
                tempMem = tempMem & 64'b01010101_00000000_01010101_00000000_10100101_00000000_10100101_00000000;
                localCounter++;
            end
            if(btnD == 1'b1)begin
                tempMem = tempMem & 64'b00000000_01010101_00000000_01010101_00000000_10100101_00000000_10100101;
                localCounter++;
            end
            if(btnL == 1'b1)begin
                tempMem = tempMem & 64'b00000000_10101010_00000000_10101010_00000000_01011010_00000000_01011010;
                localCounter++;
            end
        end
    end
    assign memoryOut = tempMem | memoryIn;
endmodule
