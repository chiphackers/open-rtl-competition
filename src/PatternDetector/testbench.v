module tb_fsm
();

    localparam         CLK_PRD  = 10;
    localparam         HLF_PRD  = CLK_PRD/2;

//---------------------------------------------------------------------------------------------------------------------
// Internal wires and registers
//---------------------------------------------------------------------------------------------------------------------
    reg                           clk;
    reg                           reset;
    reg                           data;
    reg                           trig;
    wire          [4:0]           led;
    wire                          on_led;

    
//---------------------------------------------------------------------------------------------------------------------
// Implementation
//---------------------------------------------------------------------------------------------------------------------
    initial begin
        clk      = 0;      
        forever begin
            #(HLF_PRD) clk  = ~clk;
        end
    end	

    initial begin

        reset    <= 1;
        data     <= 0;
        trig     <= 0;
        #110;

        reset    <= 0;
        #CLK_PRD;

/////////////////////////////
    $display("|_data__|_led_0_|_led_1_|_led_2_|_led_3_|_led_4_|");
    $display("|_______|_______|_______|_______|_______|_______|");
      
    data_in_t(0);
    data_in_t(0);
    data_in_t(1);
    data_in_t(0);
    data_in_t(1);
    data_in_t(1);
    data_in_t(1);
    data_in_t(0);
    data_in_t(0);
    data_in_t(1);
    data_in_t(1);
    data_in_t(0);
    data_in_t(1);
    data_in_t(1);
    data_in_t(0);
    data_in_t(1);
    data_in_t(0);
    data_in_t(1);
    data_in_t(1);
    data_in_t(0);
    data_in_t(1);
    data_in_t(0);
    data_in_t(0);
    data_in_t(1);
    data_in_t(1);
    data_in_t(0);
    data_in_t(1);
    data_in_t(0);
    #100;
    $finish;
/////////        
    end

    solution uut(
        .clk            (clk),
        .reset          (reset),
        .data           (data),
        .trig           (trig),
        .led            (led),
        .on_led         (on_led)
    );
task data_in_t;
    input d;
    begin
        #50;
        @(negedge clk) begin
            data     <= d;
            trig     <= 1;
        end
        #CLK_PRD;
        @(negedge clk) begin
            data     <= d;
            trig     <= 0;
        end
        @(posedge clk) begin
            $display("|___%b___|___%b___|___%b___|___%b___|___%b___|___%b___|",data,led[0],led[1],led[2],led[3],led[4]);
        end
    end

endtask
endmodule

