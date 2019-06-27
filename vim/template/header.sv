`timescale 1ns/100ps

module template(
    input clock,
    input reset,
    input valid,
    input [7:0] addr,
    input [7:0] data_in,
    output [7:0 data
)
    reg [7:0] [7:0] regfile;
    

    assign data = addr[data];
    
    always_ff(@posedge clock) begin
        if(reset) begin
            regfile <= #1 0;
        end else begin
            regfile[addr] <= #1 data_in
        end
    end
endmodule
