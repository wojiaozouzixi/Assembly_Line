`timescale 1ns / 1ps
// update PC 
`include "defines.vh"
module get_pc(
    input clock,
    input reset,
    
    // control signals
    input StallF,
    input PCSrcD,
    
    // input 
    input [`PCSIZE] PCPlus4F,
    input [`PCSIZE] PCBranchD,
    
    // output
    output reg[`PCSIZE] PCF
    );
    
    wire [`PCSIZE] PC_;
    
    assign PC_ = (reset == `RESETABLE)?`ZEROWORD
                :(PCSrcD == 1'b1)? PCBranchD
                :PCPlus4F;
 
    
    always @ (posedge clock) begin
        if (reset == `RESETABLE || StallF == 1'b1) begin 
            PCF <= `ZEROWORD;
        end
        else begin
            PCF <= PC_;
        end
    end
    
endmodule
