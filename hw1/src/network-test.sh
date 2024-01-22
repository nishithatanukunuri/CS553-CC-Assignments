#!/bin/bash
if [ ! -f "network-test-machinelist.txt" ]; then
    echo "Error: Input file network-test-machinelist.txt not found."
    exit 1
fi

while IFS= read -r dns_name; do
    if [ -n "$dns_name" ]; then
       avg_rtt=$(ping -c 3 "$dns_name" | tail -1 | awk '{print $4}' | cut -d '/' -f 2)
       echo "$dns_name $avg_rtt" >> "network-test-latency.txt"
    fi
done < "network-test-machinelist.txt"
echo "Network test completed.."
