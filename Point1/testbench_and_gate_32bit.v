// testbench_and_gate_32bit.v
// Testbench untuk modul and_gate_32bit
module testbench_and_gate_32bit;

    // Deklarasi sinyal yang akan terhubung ke UUT (Unit Under Test)
    reg [31:0] test_a;
    reg [31:0] test_b;
    wire [31:0] test_y;

    // Initiate UUT (Gerbang AND 32-bit)
    and_gate_32bit uut_and_gate (
        .a(test_a),
        .b(test_b),
        .y(test_y)
    );

    // Dump waveform untuk GTKWave
    initial begin
        $dumpfile("and_gate_32bit.vcd"); // Nama file VCD (untuk GTKWave)
        $dumpvars(0, testbench_and_gate_32bit); // Dump semua variabel dalam testbench
    end

    // Generasi stimulus
    initial begin
        $display("Starting simulation for AND gate...");

        // Kasus Uji 1: Semua nol
        test_a = 32'h0000_0000;
        test_b = 32'h0000_0000;
        #10; // Tunggu 10 unit waktu
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        // Kasus Uji 2: Semua satu
        test_a = 32'hFFFF_FFFF;
        test_b = 32'hFFFF_FFFF;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        // Kasus Uji 3: Nilai Campuran 1
        test_a = 32'h1234_5678;
        test_b = 32'hABCD_EF01;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        // Kasus Uji 4: Nilai Campuran 2 (A=0, B=1)
        test_a = 32'h0000_0000;
        test_b = 32'hFFFF_FFFF;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);
        
        // Kasus Uji 5: Nilai Campuran 3 (A=1, B=0)
        test_a = 32'hFFFF_FFFF;
        test_b = 32'h0000_0000;
        #10;
        $display("Time=%0t: A=0x%h, B=0x%h, Y=0x%h", $time, test_a, test_b, test_y);

        $display("Finishing simulation for AND gate.");
        $finish; // Akhiri simulasi
    end

endmodule
