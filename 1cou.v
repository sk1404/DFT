module counter_4bit (
    input wire clk,          // Clock input
    input wire reset,        // Synchronous reset
    output reg [3:0] count   // 4-bit counter output
);

    always @(posedge clk) begin
        if (reset)
            count <= 4'b0000;     // Reset to 0
        else
            count <= count + 1;   // Increment by 1
    end

endmodule

