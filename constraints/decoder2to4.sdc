###############################################################################
# Created by write_sdc
###############################################################################
current_design decoder2to4
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {clk}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {en}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {Y[0]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {Y[1]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {Y[2]}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {Y[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0500 [get_ports {Y[3]}]
set_load -pin_load 0.0500 [get_ports {Y[2]}]
set_load -pin_load 0.0500 [get_ports {Y[1]}]
set_load -pin_load 0.0500 [get_ports {Y[0]}]
set_input_transition 0.1000 [get_ports {A}]
set_input_transition 0.1000 [get_ports {B}]
set_input_transition 0.1000 [get_ports {en}]
###############################################################################
# Design Rules
###############################################################################
