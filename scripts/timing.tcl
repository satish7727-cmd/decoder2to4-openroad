read_db results/sky130hd/decoder2to4/base/6_final.odb

read_liberty platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_sdc results/sky130hd/decoder2to4/base/6_final.sdc

read_spef results/sky130hd/decoder2to4/base/6_final.spef

puts "========== WNS =========="
report_wns

puts "========== TNS =========="
report_tns

puts "========== WORST PATH =========="
report_checks -path_delay max -group_count 1

exit
