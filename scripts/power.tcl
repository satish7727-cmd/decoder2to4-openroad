# ============================================================
# UNIVERSAL OPENROAD POWER ANALYSIS
# ============================================================

if {![info exists ::env(OR_BASE)]} {
    puts "ERROR: OR_BASE is not set."
    exit 1
}

set BASE $::env(OR_BASE)

set NET  "$BASE/6_final.v"
set SDC  "$BASE/6_final.sdc"
set SPEF "$BASE/6_final.spef"

set LIB "platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"

# Check required files
foreach FILE [list $NET $SDC $SPEF $LIB] {
    if {![file exists $FILE]} {
        puts "ERROR: File not found:"
        puts $FILE
        exit 1
    }
}

puts ""
puts "=========================================="
puts "       OPENROAD POWER ANALYSIS"
puts "=========================================="
puts "BASE  : $BASE"
puts "NET   : $NET"
puts "SDC   : $SDC"
puts "SPEF  : $SPEF"
puts "LIB   : $LIB"
puts "=========================================="

# Read technology LEF
set LEF "platforms/sky130hd/lef/sky130_fd_sc_hd.tlef"
set CELL_LEF "platforms/sky130hd/lef/sky130_fd_sc_hd_merged.lef"

if {![file exists $LEF]} {
    puts "ERROR: Technology LEF not found: $LEF"
    exit 1
}

if {![file exists $CELL_LEF]} {
    puts "ERROR: Cell LEF not found: $CELL_LEF"
    exit 1
}

read_lef $LEF
read_lef $CELL_LEF

# Read Liberty
read_liberty $LIB

# Read final netlist
read_verilog $NET

# Find top module automatically
set FP [open $NET r]
set DATA [read $FP]
close $FP

if {[regexp {module\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*[\(\;]} $DATA -> TOP]} {
    puts "TOP   : $TOP"
} else {
    puts "ERROR: Cannot determine top module."
    exit 1
}

# Link
link_design $TOP

# Read constraints
read_sdc $SDC

# Read parasitics
read_spef $SPEF

puts ""
puts "=========================================="
puts "             POWER REPORT"
puts "=========================================="

report_power

puts ""
puts "=========================================="
puts "         POWER ANALYSIS COMPLETE"
puts "=========================================="
