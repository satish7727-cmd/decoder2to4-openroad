read_db results/sky130hd/decoder2to4/base/6_final.odb

read_liberty platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

puts "========== VDD IR DROP ANALYSIS =========="

set_pdnsim_net_voltage -net VDD -voltage 1.8

check_power_grid -net VDD

analyze_power_grid -net VDD

exit
