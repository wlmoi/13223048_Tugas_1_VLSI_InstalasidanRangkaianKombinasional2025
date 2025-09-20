// xor_gate_32bit.v
// Modul gerbang XOR 32-bit
module xor_gate_32bit (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] y
);
    assign y = a ^ b; // Operasi XOR bitwise
endmodule
