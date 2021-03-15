`timescale 1ns / 1ps
`define Y2RDELAY 3    // to control  delay 
`define R2GDELAY 2
module traffic_signal(highway, country_road, signal, clear, clk);       //signal=1 if car come in country road
    output reg [2:0] highway, country_road;
    input signal, clear, clk;

    parameter RED=3'b100, YELLOW=3'b010, GREEN=3'b001;              // RYG

    //state definition          highway         country_road               
    parameter   s0=3'd0,    //  GREEN           RED
                s1=3'd1,    //  YELLOW          RED
                s2=3'd2,    //  RED             RED
                s3=3'd3,    //  RED             GREEN
                s4=3'd4,    //  RED             YELLOW
                s5=3'd5;    //  RED             RED

    reg [2:0] state, next_state;        //3bit state and next_state for FSM

    always @(posedge clk) begin
        if (clear)
            #1 state<=s0;
        else
            #1 state<=next_state;
    end

    /// FSM 
    always @(state or signal) begin
        case(state)
            s0: next_state = signal ? s1 : s0;      
            s1: next_state = s2;
            s2: next_state = s3;
            s3: next_state = signal ? s3 : s4;
            s4: next_state = s5;
            s5: next_state = s0;
            default: next_state=s0;
        endcase
    end

    always @(state)
        case(state)
            s0: begin 
                    highway=GREEN;
                    country_road=RED;
            end
            s1: begin 
                    highway=YELLOW;
                    country_road=RED;
            end
            s2: begin 
                    highway=RED;
                    country_road=RED;
            end
            s3: begin 
                    highway=RED;
                    country_road=GREEN;
            end
            s4: begin 
                    highway=RED;
                    country_road=YELLOW;
            end
            s5: begin 
                    highway=RED;
                    country_road=RED;
            end
        endcase
endmodule
