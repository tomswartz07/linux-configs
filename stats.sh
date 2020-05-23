#!/bin/bash


## RasPi Temperature Stats
# Outputs C and F versions of temp, beyond the default command.

temp_c=$(/opt/vc/bin/vcgencmd measure_temp | awk -F "[=\']" '{print($2)}')
temp_f=$(echo "${temp_c} * 1.8 + 32" | bc )
echo "temp = ${temp_c}°C"
echo "temp = ${temp_f}°F"
