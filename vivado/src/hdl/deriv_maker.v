`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2018 08:08:30 PM
// Design Name: 
// Module Name: deriv_maker
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

module deriv_maker(
    input clk,
    input [31:0] data_in,
    input valid_in,
    output valid_out,
    output [31:0] data_out
    );
parameter CEPSTRALS = 2'b00;
parameter DCEPSTRALS = 2'b01;
parameter DDCEPSTRALS = 2'b10;
 
reg [31:0] cep0, cep1, cep2, dcep0, dcep1, dcep2;
reg [5:0] counter = 6'b0;
reg [1:0] state = 2'b00;
reg valid_out_r;
reg [31:0] data_out_r;

always @(posedge clk) begin

    case (state)
    CEPSTRALS: begin
        valid_out_r <= valid_in;
        data_out_r <= data_in;
        if (valid_in) begin
            cep0 <= data_in;
            cep1 <= cep0;
            cep2 <= cep1;
            counter <= counter + 1;
            if (counter >= 6'h2) begin
                state <= DCEPSTRALS;
            end
        end
    end
    
    DCEPSTRALS: begin
        valid_out_r <= 1'b1;
        data_out_r <= cep0 - cep2;
        dcep0 <= cep0 - cep2;
        dcep1 <= dcep0;
        dcep2 <= dcep1;
        if (counter > 6'h4 || counter == 6'h0) begin
            state <= DDCEPSTRALS;
        end
        else begin
            state <= CEPSTRALS;
        end
    end
    
    DDCEPSTRALS: begin
        valid_out_r <= 1'b1;
        data_out_r <= dcep0 - dcep2;
        state <= CEPSTRALS;
    end
    endcase
end

assign valid_out = valid_out_r;
assign data_out = data_out_r;

/*always @(posedge clk) begin
    case (state)
    CEPSTRALS: begin
        valid_out_r <= valid_in;
        data_out_r <= data_in;
        if (valid_in) begin
            cepstrals[counter] <= data_in;
            counter <= counter + 1;
            if (counter == 6'b111111) begin
                state = DCEPSTRALS;
                last_cepstral <= cepstrals[0];
                counter <= 6'b000010;
            end
        end
    end
    
    DCEPSTRALS: begin
        valid_out_r <= 1'b1;
        cepstrals[counter-2] <= cepstrals[counter] - last_cepstral;
        last_cepstral <= cepstrals[counter-1];
        data_out_r <= cepstrals[counter] - last_cepstral;
        counter <= counter + 1;
        if (counter == 6'b111111) begin
            state = DDCEPSTRALS;
            last_cepstral <= cepstrals[0];
            counter <= 6'b000010;
        end
    end
    
    DDCEPSTRALS: begin
        valid_out_r <= 1'b1;
        data_out_r <= cepstrals[counter] - last_cepstral;
        last_cepstral <= cepstrals[counter-1];
        counter <= counter + 1;
        if (counter == 6'b111101) begin
            state = CEPSTRALS;
            counter <= 6'b0;
        end
    end
    endcase
end

assign valid_out = valid_out_r;
assign data_out = data_out_r;*/

endmodule
