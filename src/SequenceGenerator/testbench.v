module testbench;

reg clk, rst;
wire [2:0] out;
reg [2:0] detector;

test seqGenertor(clk, rst, out);

always@(posedge clk) begin
    if(rst == 1'b1)
        detector = 3'b000;
    else begin
        case (detector)
            3'b000: detector <= 3'b010;
            3'b010: detector <= 3'b011;
            3'b011: detector <= 3'b101;
            3'b101: detector <= 3'b000;
        endcase
    end
end

initial begin
    rst = 1'b1;
    clk = 1'b0;
    #10;
    rst = 1'b0;
    @ (posedge clk);

    @ (posedge clk);
    repeat(5) begin
        if(detector == out)
            $display("PASS");
        else
            $display("FAIL");
    end
    
    $finish;

end

always #2  clk <= ~clk;

endmodule

