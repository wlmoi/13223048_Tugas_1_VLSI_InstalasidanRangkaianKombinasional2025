// and_gate_32bit.v
// Modul gerbang AND 32-bit
module and_gate_32bit (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] y
);
    assign y = a & b; // Operasi AND bitwise
endmodule
