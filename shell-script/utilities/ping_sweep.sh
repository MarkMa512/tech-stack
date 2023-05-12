#!/bin/bash

# This script will ping a range of IP addresses and report which ones are up.
# It will take a subnet as an argument and ping all IP addresses in the range
# https://www.youtube.com/watch?v=U79cJfDTIrQ&t=1s

echo "Please enter the subnet:" 
read SUBNET

# for each IP in the range 1-254, ping it and report if it is up
for IP in $(seq 1 254); do
    ping -c 1 $SUBNET.$IP | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done