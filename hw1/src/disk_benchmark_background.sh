#!/bin/bash
echo "Running the dd command in the background..."
dd if=/dev/zero of=output.txt bs=1M count=5000 conv=fdatasync > disk_benchmark_log.txt 2>&1 &
echo "The dd command is running in the background."
sleep 10
