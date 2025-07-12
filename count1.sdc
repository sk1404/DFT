# sdc_constraints.sdc

# Define the clock
create_clock -name clk -period 10.0 [get_ports clk]

# Set input and output delays
set_input_delay 2.0 -clock clk [get_ports reset]
set_output_delay 2.0 -clock clk [get_ports count]

# Set driving cell and load for realistic synthesis
set_drive 2 [get_ports reset]
set_load 4 [get_ports count]

# Define false paths or multi-cycle paths if needed (optional)
# set_false_path -from [get_ports reset]

# Prevent timing optimization on asynchronous reset if needed
set_max_delay -from [get_ports reset] -to [get_ports count] 5.0

# Prevent synthesis tool from optimizing away unused signals (if applicable)
# set_critical_range 3.0 [get_ports count]
