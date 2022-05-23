module jc2 (
    goLeft,
    goRight,
    stop,
    clk,
    q
);

input goLeft;
input goRight;
input stop;
input clk;
output [3:0] q;
reg [3:0] q;

reg run;
reg [0:0] dir;


always @(posedge clk) begin: _jc2_logic
    if ((goRight == 0)) begin
        dir <= 1'b0;
        run <= 1;
    end
    else if ((goLeft == 0)) begin
        dir <= 1'b1;
        run <= 1;
    end
    if ((stop == 0)) begin
        run <= 0;
    end
    if (run) begin
        // synthesis parallel_case full_case
        casez (dir)
            1'b1: begin
                q[4-1:1] <= q[3-1:0];
                q[0] <= (!q[3]);
            end
            default: begin
                q[3-1:0] <= q[4-1:1];
                q[3] <= (!q[0]);
            end
        endcase
    end
end

endmodule