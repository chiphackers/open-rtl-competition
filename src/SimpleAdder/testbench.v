module testbench;

reg [3:0] a,b;
wire [3:0] o;

solution my_adder(a,b,o);

initial begin
    #10;
    a = 4'b0010;
    b = 4'b0100;
    #2;
    $display("a+b = %b",o);
    a = 4'b1010;
    b = 4'b0101;
    #2;
    $display("a+b = %b",o);
    a = 4'b0110;
    b = 4'b0101;
    #2;
    $display("a+b = %b",o);


end


endmodule

