module test(
  input clk, rst,
  output reg [2:0] out
);
  
  reg [1:0] CURRENT_STATE;
  
  always@(posedge clk) begin
    if(rst == 1'b1) begin
      CURRENT_STATE <= 2'b00;
      out <= 3'b000;
    end else begin
      
      case (CURRENT_STATE)
        
      	2'b00: begin
          CURRENT_STATE <= 2'b01;
          out <= 3'b010;
        end
        2'b01: begin
          CURRENT_STATE <= 2'b11;
          out <= 3'b011;
        end
        2'b11: begin
          CURRENT_STATE <= 2'b10;
          out <= 3'b101;
        end
        2'b10: begin
          CURRENT_STATE <= 2'b00;
          out <= 3'b000;
        end
        
      endcase
      
      
    end
  end
  
endmodule
