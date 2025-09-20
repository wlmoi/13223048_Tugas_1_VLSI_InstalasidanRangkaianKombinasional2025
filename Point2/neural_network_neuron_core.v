// neural_network_neuron_core.v
// Modul inti neuron: Parallel Multiplier-Accumulator (MAC) dengan bias
module neural_network_neuron_core (
    input wire [7:0] x0, x1, x2, x3, // 8-bit inputs
    input wire [7:0] w0, w1, w2, w3, // 8-bit weights
    input wire [7:0] bias_in,        // 8-bit bias
    output wire [17:0] sum_out       // 18-bit output sebelum ReLU
);

    // Sinyal internal untuk hasil perkalian (8-bit * 8-bit = 16-bit)
    wire [15:0] p0, p1, p2, p3;

    // Sinyal internal untuk penjumlahan sementara
    wire [16:0] s0, s1;         // Jumlah dua bilangan 16-bit membutuhkan 17 bit
    wire [17:0] s_products;     // Jumlah empat bilangan 16-bit membutuhkan 18 bit
    
    // Bias yang telah diperluas tanda (sign-extended)
    wire [17:0] bias_extended;

    // 1. Perkalian Paralel (8-bit * 8-bit -> 16-bit)
    // Asumsi: x dan w adalah signed 2's complement, sehingga p adalah signed 2's complement.
    assign p0 = $signed(x0) * $signed(w0);
    assign p1 = $signed(x1) * $signed(w1);
    assign p2 = $signed(x2) * $signed(w2);
    assign p3 = $signed(x3) * $signed(w3);

    // 2. Penjumlahan Tree (adder paralel)
    // s0 = p0 + p1 (16-bit + 16-bit = max 17-bit hasil)
    // s1 = p2 + p3 (16-bit + 16-bit = max 17-bit hasil)
    assign s0 = $signed(p0) + $signed(p1);
    assign s1 = $signed(p2) + $signed(p3);

    // s_products = s0 + s1 (17-bit + 17-bit = max 18-bit hasil)
    assign s_products = $signed(s0) + $signed(s1);

    // 3. Tambahkan Bias
    // Perluas tanda bias 8-bit menjadi 18 bit
    // {{10{bias_in[7]}}}: mengulang bit tanda (MSB) 10 kali untuk mengisi bit-bit atas
    assign bias_extended = {{10{bias_in[7]}}, bias_in};

    assign sum_out = $signed(s_products) + $signed(bias_extended);

endmodule
