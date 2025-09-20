// relu_activation.v
// Modul fungsi aktivasi ReLU
module relu_activation (
    input wire [17:0] input_val,  // Input 18-bit dari inti neuron
    output wire [17:0] output_val // Output 18-bit setelah ReLU
);

    // ReLU: f(x) = max(0, x)
    // Jika input_val positif atau nol (bit tanda input_val[17] adalah 0),
    // maka output_val adalah input_val itu sendiri.
    // Jika input_val negatif (bit tanda input_val[17] adalah 1),
    // maka output_val adalah nol (18'h00000).
    assign output_val = (input_val[17] == 1'b0) ? input_val : 18'h00000;

endmodule
