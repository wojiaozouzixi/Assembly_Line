`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2019 10:55:17 PM
// Design Name: 
// Module Name: get_ResultW_withHilo_withPC
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

`include "defines.vh"
module get_ResultW_withHilo_withPC(
    input clock,
    input reset,
    
    // control signal
    input PCtoRegW,
    
    // input 
    input [`DATALENGTH] ResultW_withHilo,
    input [`PCSIZE] PCPlus8W,
    
    output reg[`DATALENGTH] ResultW_withHilo_withPC,
    output reg[`DATALENGTH] debug_wb_rf_wdata
    );
    
    always@(*)begin
        if(reset == `RESETABLE)begin
            ResultW_withHilo_withPC <= `ZEROWORD;
        end else begin
            if(PCtoRegW == 1'b1)begin
                ResultW_withHilo_withPC <= PCPlus8W;
            end else begin
                ResultW_withHilo_withPC <= ResultW_withHilo;
            end
        end
    end
    
    always@(*)begin
        debug_wb_rf_wdata<=ResultW_withHilo_withPC;
    end
    
endmodule
