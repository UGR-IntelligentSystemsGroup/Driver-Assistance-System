#!/bin/bash
# Put header at the start of the log, remove NEW DAY comments from $1 file

filename=$1
output=out/clean-log.csv

# Write header
grep -m 1 Driver $filename > $output

# Write clean log
grep -o '^[^#]*' $filename >> $output