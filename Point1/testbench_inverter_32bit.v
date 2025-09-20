// testbench_inverter_32bit.v
// Testbench untuk modul inverter_32bit
module testbench_inverter_32bit;

    reg [31:0] test_a;
    wire [31:0] test_y;

    inverter_32bit uut_inverter (
        .a(test_a),
        .y(test_y)
    );

    initial begin
        $dumpfile("inverter_32bit.vcd");
        $dumpvars(0, testbench_inverter_32bit);
    end

    initial begin
        $display("Starting simulation for Inverter gate...");

        // Kasus Uji 1: Semua nol
        test_a = 32'h0000_0000;
        #10;
        $display("Time=%0t: A=0x%h, Y=0x%h", $time, test_a, test_y);

        // Kasus Uji 2: Semua satu
        test_a = 32'hFFFF_FFFF;
        #10;
        $display("Time=%0t: A=0x%h, Y=0x%h", $time, test_a, test_y);

        // Kasus Uji 3: Nilai Campuran
        test_a = 32'h1234_5678;
        #10;
        $display("Time=%0t: A=0x%h, Y=0x%h", $time, test_a, test_y);

        // Kasus Uji 4: Setengah nol, setengah satu
        test_a = 32'h0000_FFFF;
        #10;
        $display("Time=%0t: A=0x%h, Y=0x%h", $time, test_a, test_y);
        
        $display("Finishing simulation for Inverter gate.");
        $finish;
    end

endmodule
