# Traffic-Light-Control-System
Implemented a traffic light control system using the Intel 8086 microprocessor, utilizing assembly language to program the 8255 Programmable Peripheral Interface (PPI) for LED control. 
# Traffic Light Control System using Intel 8086 Microprocessor

## Overview

This project implements a traffic light control system using the Intel 8086 microprocessor and the 8255 Programmable Peripheral Interface (PPI). The system is programmed in assembly language to control LED lights representing traffic signals (red, yellow, and green) with specific timing sequences.

## Files

- `traffic_light.asm`: Assembly code for the traffic light control system.
- `README.md`: This readme file, providing an overview and instructions for the project.

## Hardware Requirements

- Intel 8086 microprocessor
- 8255 Programmable Peripheral Interface (PPI)
- LEDs (red, yellow, green)
- Resistors and other necessary electronic components for interfacing
- Breadboard and connecting wires

## Software Requirements

- An assembler for Intel 8086 assembly language (e.g., MASM, TASM)
- A simulator/emulator for testing the assembly code (optional)

## Assembly Code Explanation

### Initialization

The PPI is initialized with the control word `0x80`, which sets all ports (A, B, C) as output ports.

### Main Routine

The main routine follows a simple traffic light sequence:
1. Red light is turned on for a specified duration.
2. Yellow light is turned on for a specified duration.
3. Green light is turned on for a specified duration.
4. The sequence repeats indefinitely.

### Delay Routine

A delay subroutine is used to create the timing for each light. The delay duration can be adjusted by changing the initial value in the CX register.

### Port Addresses and Bit Patterns

- `PPI_CONTROL_PORT`: Address for the control port of the 8255 PPI.
- `PORT_A`: Address for port A of the 8255 PPI.
- `PORT_B`: Address for port B of the 8255 PPI.
- `PORT_C`: Address for port C of the 8255 PPI.
- `RED_LIGHT`: Bit pattern for the red light (0000 0001).
- `YELLOW_LIGHT`: Bit pattern for the yellow light (0000 0010).
- `GREEN_LIGHT`: Bit pattern for the green light (0000 0100).

## How to Assemble and Run

1. Write or copy the assembly code into a file named `traffic_light.asm`.
2. Assemble the code using an 8086 assembler (e.g., MASM or TASM).
3. Load the assembled code into the 8086 microprocessor or an emulator.
4. Connect the LEDs to the appropriate ports of the 8255 PPI.
5. Run the program to observe the traffic light sequence.

## Example Command (using MASM)

```bash
masm traffic_light.asm;
link traffic_light.obj;
