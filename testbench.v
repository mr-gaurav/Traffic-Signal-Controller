`timescale 1ns / 1ps

module testbench();
    reg signal, clear, clk=0;
    wire [2:0] highway, country_road;

    traffic_signal dut (highway, country_road, signal, clear, clk);

    always #5 clk=~clk;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0);
        $monitor("time=%g, highway=%b, country_road=%b, signal=%b", $time, highway, country_road, signal);

        #1 clear=1;
        repeat(1) @(negedge clk);       
        clear=0; signal=0;              
        repeat(3) @(negedge clk);
        signal=1;
        repeat(5) @(negedge clk);
        signal=0;
        repeat(7) @(negedge clk);
        signal=1;
        repeat(8) @(negedge clk);
        signal=0;
        repeat(6) @(negedge clk);
        signal=1;
        repeat(9) @(negedge clk);
        signal=0;
        repeat(5) @(negedge clk);
        signal=1;
        repeat(10) @(negedge clk);
        signal=0;

        #100 $finish;
    end
endmodule
