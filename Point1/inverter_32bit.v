// inverter_32bit.v
// Modul Inverter 32-bit
module inverter_32bit (
    input wire [31:0] a,
    output wire [31:0] y
);
    assign y = ~a; // Operasi NOT bitwise
endmodule
