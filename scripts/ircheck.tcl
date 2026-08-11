read_db results/sky130hd/decoder2to4/base/6_final.odb

puts "========== VDD POWER GRID =========="
check_power_grid -net VDD

puts "========== VSS POWER GRID =========="
check_power_grid -net VSS

exit
