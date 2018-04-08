module testbench;

reg clk, rst;
wire [2:0] out;

solution seqGenertor(.clk(clk), .rst(rst), .out(out));

initial begin
    rst = 1'b1;
    clk = 1'b0;
    #10;
    rst = 1'b0;
    @ (posedge clk);

    @ (posedge clk);
    $display("out = %b",out);
    
    @ (posedge clk);
    $display("out = %b",out);
    
    @ (posedge clk);
    $display("out = %b",out);
    
    @ (posedge clk);
    $display("out = %b",out);
    
    @ (posedge clk);
    $display("out = %b",out);
    
    $finish;

end

always #2  clk <= ~clk;

endmodule

