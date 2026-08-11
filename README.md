# 2-to-4 Decoder ASIC Implementation using OpenROAD

## 📌 Project Overview

This project implements a synchronous 2-to-4 decoder and takes the design through a complete digital ASIC RTL-to-GDSII flow using OpenROAD-flow-scripts and the SKY130HD standard-cell library.

The design was written in Verilog, functionally verified using simulation, synthesized using Yosys, and physically implemented using OpenROAD.

The project demonstrates the complete digital ASIC implementation flow from RTL design to final physical layout.

---

## 🎯 Design Objective

The objective of this project is to implement a 2-to-4 decoder with:

- Two input signals: `A` and `B`
- Enable signal: `en`
- Clock signal: `clk`
- Four output signals: `Y[3:0]`

The decoder produces one-hot output corresponding to the binary value of inputs `A` and `B`.

---

## 🧩 Decoder Truth Table

| Enable | A | B | Y[3:0] |
|:------:|:-:|:-:|:------:|
| 0 | X | X | 0000 |
| 1 | 0 | 0 | 0001 |
| 1 | 0 | 1 | 0010 |
| 1 | 1 | 0 | 0100 |
| 1 | 1 | 1 | 1000 |

The output is updated on the rising edge of the clock.

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| Verilog | RTL design |
| Icarus Verilog | RTL and gate-level simulation |
| GTKWave | Waveform analysis |
| Yosys | RTL synthesis |
| OpenROAD | Physical design |
| OpenROAD-flow-scripts | Complete RTL-to-GDS flow |
| SKY130 PDK | Semiconductor technology |
| SKY130HD | Standard-cell library |

---

## 🔬 Technology

- Process: SKY130
- Standard-cell library: SKY130HD
- Supply voltage: 1.8 V
- Clock period: 10 ns
- Target clock frequency: 100 MHz

---

# 🔄 RTL-to-GDSII Flow

The design was implemented using the following ASIC flow:

```text
                Verilog RTL
                    │
                    ▼
             RTL Simulation
                    │
                    ▼
             Logic Synthesis
                 (Yosys)
                    │
                    ▼
              Floorplanning
                    │
                    ▼
            Power Distribution
                 Network
                    │
                    ▼
                Placement
                    │
                    ▼
       Clock Tree Synthesis (CTS)
                    │
                    ▼
             Global Routing
                    │
                    ▼
            Detailed Routing
                    │
                    ▼
              Filler Cells
                    │
                    ▼
             Final Extraction
                    │
                    ▼
               GDSII Layout
