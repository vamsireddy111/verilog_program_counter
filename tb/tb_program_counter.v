`timescale 1ns/1ps

module program_counter_tb;

reg clk;
reg reset;
reg enable;
reg load;
reg [3:0] addr_in;
wire [3:0] pc_out;

// Instantiate DUT
program_counter uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .load(load),
    .addr_in(addr_in),
    .pc_out(pc_out)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    enable = 1;
    load = 0;
    addr_in = 4'b0000;

    $dumpfile("pc.vcd");
    $dumpvars(0, program_counter_tb);

    // Release reset
    #10 reset = 0;

    // Normal counting
    #30;

    // Jump to address 1010
    load = 1;
    addr_in = 4'b1010;
    #10;

    // Back to normal increment
    load = 0;
    #30;

    // Disable PC (hold value)
    enable = 0;
    #20;

    // Enable again
    enable = 1;
    #20;

    $finish;
end

initial begin
    $monitor("Time=%0t | PC=%b | load=%b | enable=%b", 
              $time, pc_out, load, enable);
end

endmodule
