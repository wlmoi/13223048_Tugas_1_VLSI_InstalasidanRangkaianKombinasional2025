// or_gate_32bit.v
// Modul gerbang OR 32-bit
module or_gate_32bit (
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [31:0] y
);
    assign y = a | b; // Operasi OR bitwise
endmodule
