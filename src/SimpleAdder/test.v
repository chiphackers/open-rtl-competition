module solution(
    data_a_i,
    data_b_i,
    data_o
);

input [3:0] data_a_i;
input [3:0] data_b_i;

output [3:0] data_o;

assign data_o = data_a_i + data_b_i;

endmodule
