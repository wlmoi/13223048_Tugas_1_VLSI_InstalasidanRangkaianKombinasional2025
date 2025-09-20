// full_neuron.v
// Modul neuron lengkap yang mengintegrasikan inti neuron dan aktivasi ReLU
module full_neuron (
    input wire [7:0] x0, x1, x2, x3, // 8-bit inputs
    input wire [7:0] w0, w1, w2, w3, // 8-bit weights
    input wire [7:0] bias_in,        // 8-bit bias
    output wire [17:0] neuron_output // 18-bit output akhir neuron
);

    wire [17:0] sum_before_relu; // Sinyal internal untuk hasil penjumlahan sebelum ReLU

    // Instansiasi modul inti neuron
    neural_network_neuron_core uut_neuron_core (
        .x0(x0), .x1(x1), .x2(x2), .x3(x3),
        .w0(w0), .w1(w1), .w2(w2), .w3(w3),
        .bias_in(bias_in),
        .sum_out(sum_before_relu)
    );

    // Instansiasi modul fungsi aktivasi ReLU
    relu_activation uut_relu (
        .input_val(sum_before_relu),
        .output_val(neuron_output)
    );

endmodule
