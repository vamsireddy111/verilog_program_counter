module program_counter (
    input clk,
    input reset,
    input enable,
    input load,
    input [3:0] addr_in,
    output reg [3:0] pc_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc_out <= 4'b0000;
    else if (enable) begin
        if (load)
            pc_out <= addr_in;   // Jump
        else
            pc_out <= pc_out + 1; // Next instruction
    end
end

endmodule
