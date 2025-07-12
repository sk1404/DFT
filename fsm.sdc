# Define a primary clock with 10 ns period
create_clock -name clk -period 10 [get_ports clk]

# Set input delay for 'reset' and 'in' signals relative to clock
set_input_delay -clock clk 2 [get_ports reset]
set_input_delay -clock clk 2 [get_ports in]

# Set output delay for 'detected' signal relative to clock
set_output_delay -clock clk 2 [get_ports detected]

# Optional: constraints for multicycle paths or false paths can be added here
# set_false_path -from [get_ports reset]
