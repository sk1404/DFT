



module fsm1011 (
    input wire clk,
    input wire rst,
    input wire x,
    output reg y
);

    reg [2:0] ps, ns;

    // State encoding
    parameter s0 = 3'd0,
              s1 = 3'd1,
              s2 = 3'd2,
              s3 = 3'd3;

    // State transition
    always @(posedge clk) begin
        if (rst)
            ps <= s0;
        else
            ps <= ns;
    end

    // Next state and output logic (Mealy type)
    always @(*) begin
        case (ps)
            s0: begin
                y = 0;
                if (x) ns = s1;
                else   ns = s0;
            end
            s1: begin
                y = 0;
                if (x) ns = s1;
                else   ns = s2;
            end
            s2: begin
                y = 0;
                if (x) ns = s3;
                else   ns = s0;
            end
            s3: begin
                if (x) begin
                    y = 1; // Mealy output
                    ns = s1;
                end else begin
                    y = 0;
                    ns = s2;
                end
            end
            default: begin
                y = 0;
                ns = s0;
            end
        endcase
    end

endmodule
