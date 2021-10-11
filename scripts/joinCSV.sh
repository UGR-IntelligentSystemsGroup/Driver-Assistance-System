#!/bin/bash
# Join recognized logs into one single CSV

cd ..
output=out/log-recognized/combined-log.csv

# Find header
first_log=$(ls out/log-recognized/log-driver*.csv | sort -V | tail -n +1 | head -1)
grep -m 1 Driver $first_log > $output

# Combine
for filename in `ls out/log-recognized/log-driver*.csv | sort -V | tail -n +1`; do
    grep -o '^[^#]*' $filename >> $output
done;
