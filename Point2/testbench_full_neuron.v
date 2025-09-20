// testbench_full_neuron.v

module testbench_full_neuron;

    // Declare signals (reg for inputs, wire for outputs) for the UUT
    reg [7:0] x0, x1, x2, x3;
    reg [7:0] w0, w1, w2, w3;
    reg [7:0] bias_in;
    wire [17:0] neuron_output;

    // Instantiate the Unit Under Test (UUT)
    full_neuron uut_neuron (
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .w0(w0),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .bias_in(bias_in),
        .neuron_output(neuron_output)
    );

    // Dump waveforms for GTKWave
    initial begin
        $dumpfile("full_neuron.vcd");
        $dumpvars(0, testbench_full_neuron); // Dump all signals in this module
    end

    // Stimulus generation
    initial begin
        // Initialize inputs to a known state at time 0
        x0 = 8'h00; x1 = 8'h00; x2 = 8'h00; x3 = 8'h00;
        w0 = 8'h00; w1 = 8'h00; w2 = 8'h00; w3 = 8'h00;
        bias_in = 8'h00;
        #10; // Wait 10 time units for initial setup

        // --- Test Case 1: Positive output ---
        x0 = 8'h0A; // 10
        x1 = 8'h05; // 5
        x2 = 8'h02; // 2
        x3 = 8'h01; // 1

        w0 = 8'h02; // 2
        w1 = 8'h03; // 3
        w2 = 8'h04; // 4
        w3 = 8'h05; // 5

        bias_in = 8'h01; // 1
        #10;
        // Expected sum_before_relu = (10*2) + (5*3) + (2*4) + (1*5) + 1 = 20 + 15 + 8 + 5 + 1 = 49
        // neuron_output should be 49

        // --- Test Case 2: Negative sum_before_relu, output should be 0 due to ReLU ---
        // Using 2's complement for negative numbers: -1 is 8'hFF, -128 is 8'h80
        x0 = 8'hFF; // -1
        x1 = 8'hFF; // -1
        x2 = 8'hFF; // -1
        x3 = 8'hFF; // -1

        w0 = 8'h02; // 2
        w1 = 8'h02; // 2
        w2 = 8'h02; // 2
        w3 = 8'h02; // 2

        bias_in = 8'h01; // 1
        #10;
        // Expected sum_before_relu = (-1*2) + (-1*2) + (-1*2) + (-1*2) + 1 = -2 - 2 - 2 - 2 + 1 = -8 + 1 = -7
        // neuron_output should be 0

        // --- Test Case 3: Another positive output, with larger values ---
        x0 = 8'h7F; // 127
        x1 = 8'h7F; // 127
        x2 = 8'h7F; // 127
        x3 = 8'h7F; // 127

        w0 = 8'h01; // 1
        w1 = 8'h01; // 1
        w2 = 8'h01; // 1
        w3 = 8'h01; // 1

        bias_in = 8'h01; // 1
        #10;
        // Expected sum_before_relu = (127*1) * 4 + 1 = 508 + 1 = 509
        // neuron_output should be 509

        // --- Test Case 4: Zero sum_before_relu, output should be 0 ---
        x0 = 8'h00; // 0
        x1 = 8'h00; // 0
        x2 = 8'h00; // 0
        x3 = 8'h00; // 0

        w0 = 8'h00; // 0
        w1 = 8'h00; // 0
        w2 = 8'h00; // 0
        w3 = 8'h00; // 0

        bias_in = 8'h00; // 0
        #10;
        // Expected sum_before_relu = 0
        // neuron_output should be 0

        // --- Test Case 5: Large negative product sum, resulting in 0 after ReLU ---
        x0 = 8'h80; // -128
        x1 = 8'h80; // -128
        x2 = 8'h80; // -128
        x3 = 8'h80; // -128

        w0 = 8'h01; // 1
        w1 = 8'h01; // 1
        w2 = 8'h01; // 1
        w3 = 8'h01; // 1

        bias_in = 8'h7F; // 127
        #10;
        // Expected sum_before_relu = (-128 * 1) * 4 + 127 = -512 + 127 = -385
        // neuron_output should be 0

        // --- Test Case 6: Mixed positive/negative inputs, yielding positive output ---
        x0 = 8'h05; // 5
        x1 = 8'hFF; // -1
        x2 = 8'h0A; // 10
        x3 = 8'hF0; // -16

        w0 = 8'h02; // 2
        w1 = 8'h03; // 3
        w2 = 8'h01; // 1
        w3 = 8'h01; // 1

        bias_in = 8'h01; // 1
        #10;
        // Expected sum_before_relu = (5*2) + (-1*3) + (10*1) + (-16*1) + 1
        // = 10 - 3 + 10 - 16 + 1 = 21 - 19 + 1 = 2 + 1 = 3
        // neuron_output should be 3

        $finish; // End simulation
    end

endmodule
