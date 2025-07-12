module ten (
    input clk,            // Clock signal
    input rst,            // Asynchronous reset signal
    output reg [9:0] count // 10-bit counter output
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 10'b0;         // Reset counter to 0
    else
        count <= count + 1'b1;  // Increment counter
end

endmodule

