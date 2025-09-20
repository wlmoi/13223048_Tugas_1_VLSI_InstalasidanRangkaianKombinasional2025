// testbench_or_gate_32bit.v
// Testbench untuk modul or_gate_32bit
module testbench_or_gate_32bit;

    reg [31:0] test_a;
    reg [31:0] test_b;
    wire [31:0] test_y;

    or_gate_32bit uut_or_gate (
        .a(test_a),
        .b(test_b),
        .y(test_y)
    );

    initial begin
        $dumpfile("or_gate_32bit.vcd");
        $dumpvars(0, testbench_or_gate_32bit);
    end

    initial begin
        $display("Starting simulation for OR gate...");

        // Kasus Uji 1: Semua nol
        test_a = 32'h0000_0000;
        test_b = 32'h0000_0000;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        // Kasus Uji 2: Satu input semua satu, yang lain semua nol
        test_a = 32'hFFFF_FFFF;
        test_b = 32'h0000_0000;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        // Kasus Uji 3: Input lainnya semua satu, yang pertama semua nol
        test_a = 32'h0000_0000;
        test_b = 32'hFFFF_FFFF;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        // Kasus Uji 4: Kedua input semua satu
        test_a = 32'hFFFF_FFFF;
        test_b = 32'hFFFF_FFFF;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        // Kasus Uji 5: Nilai Campuran
        test_a = 32'h1234_5678;
        test_b = 32'hABCD_EF01;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        $display("Finishing simulation for OR gate.");
        $finish;
    end

endmodule
