`timescale 1ns / 1ps

module solution
#(
//---------------------------------------------------------------------------------------------------------------------
// parameter definitions
//---------------------------------------------------------------------------------------------------------------------
    parameter            LED_W            = 5

)
(
//---------------------------------------------------------------------------------------------------------------------
// I/O signals
//---------------------------------------------------------------------------------------------------------------------
    input                                clk,
    input                                reset,
    input                                data,
    input                                trig,
    output  reg     [LED_W-1:0]          led,

    output  reg                          on_led
);

//---------------------------------------------------------------------------------------------------------------------
// Global constant headers
//---------------------------------------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------------------------------------
// localparam definitions
//---------------------------------------------------------------------------------------------------------------------
    localparam      NO_OF_STATES         = 6;

    localparam      STATE_INIT           = 0;
    localparam      STATE_S1             = 1;
    localparam      STATE_S2             = 2;
    localparam      STATE_S3             = 3;
    localparam      STATE_S4             = 4;
    localparam      STATE_S5             = 5;
 
//---------------------------------------------------------------------------------------------------------------------
// Internal wires and registers
//---------------------------------------------------------------------------------------------------------------------
    reg         [NO_OF_STATES-1:0]      state;                                        
//---------------------------------------------------------------------------------------------------------------------
// Implementation
//---------------------------------------------------------------------------------------------------------------------
    
    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            state                      <= STATE_INIT;
            led                        <= {LED_W{1'b0}};
            on_led                     <= 1'b0;
        end
        else begin
            on_led                     <= 1'b1;
            case (state)
                STATE_INIT  : begin
                    if (trig) begin
                        if (data) begin
                            state              <= STATE_S1;
                            led                <= 5'b00001;
                        end
                        else begin
                            led                <= 5'b00000;
                        end
                    end 
                end
                STATE_S1    : begin
                    if (trig) begin
                        if (data) begin
                            state              <= STATE_S2;
                            led                <= 5'b00011;
                        end
                        else begin
                            state              <= STATE_INIT;
                            led                <= 5'b00000;
                        end 
                    end  
                end
                STATE_S2    : begin
                    if (trig) begin
                        if (data) begin
                            led                <= 5'b00011;
                        end
                        else begin
                            state              <= STATE_S3;
                            led                <= 5'b00111;
                        end 
                    end  
                end
                STATE_S3    : begin
                    if (trig) begin
                        if (data) begin
                            state              <= STATE_S4;
                            led                <= 5'b01111;             
                        end
                        else begin
                            state              <= STATE_INIT;
                            led                <= 5'b00000;
                        end
                    end
                end
                STATE_S4    : begin
                    if (trig) begin
                        if (data) begin
                            state              <= STATE_S2;
                            led                <= 5'b00011;
                        end
                        else begin
                            state              <= STATE_S5;
                            led                <= 5'b11111;
                        end
                    end
                end
                STATE_S5    : begin
                    if (trig) begin
                        if (data) begin
                            state              <= STATE_S1;
                            led                <= 5'b00001;
                        end
                        else begin
                            state              <= STATE_INIT;
                            led                <= 5'b00000;
                        end
                    end
                end
                default : begin
                    state                   <= STATE_INIT;
                    led                     <= {LED_W{1'b0}};
                end
            endcase   
        end
    end
endmodule

