# Program Counter (PC) – Verilog
# Overview

The Program Counter (PC) is a fundamental component in any processor.
It holds the address of the next instruction to be executed and updates on every clock cycle.

This project implements a 4-bit Program Counter with support for:

Sequential instruction execution
Jump (load new address)
Enable/disable control
Asynchronous reset

# Inputs & Outputs
Signal	       Type	                 Description
clk	           Input	              Clock signal
reset	         Input	              Resets PC to 0
enable	       Input	            Enables PC update
load	         Input	           Loads external address
addr_in	     Input [3:0]	       Address to load (jump)
pc_out	     Output [3:0]	         Current PC value

# Applications
 Instruction Fetch Unit in CPUs
 Loop and branch control
 Jump and branch instructions
 Core component of RISC architecture
