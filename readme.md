cd D:\13223048_Tugas_1_VLSI_InstalasidanRangkaianKombinasional2025\Point1

iverilog -o and_gate_sim and_gate_32bit.v testbench_and_gate_32bit.v
vvp and_gate_sim
gtkwave and_gate_32bit.vcd

iverilog -o or_gate_sim or_gate_32bit.v testbench_or_gate_32bit.v
vvp or_gate_sim
gtkwave or_gate_32bit.vcd

iverilog -o xor_gate_sim xor_gate_32bit.v testbench_xor_gate_32bit.v
vvp xor_gate_sim
gtkwave xor_gate_32bit.vcd

iverilog -o inverter_gate_sim inverter_32bit.v testbench_inverter_32bit.v
vvp inverter_gate_sim
gtkwave inverter_32bit.vcd

cd D:\13223048_Tugas_1_VLSI_InstalasidanRangkaianKombinasional2025\Point2
iverilog -o full_neuron_sim neural_network_neuron_core.v relu_activation.v full_neuron.v testbench_full_neuron.v
vvp full_neuron_sim
gtkwave full_neuron.vcd

