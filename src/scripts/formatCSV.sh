#!/bin/bash
# Put header at the start of the log, remove NEW DAY comments from $1 file

filename=$1

# Get driver name
tmp=${filename#*-log-}   # remove prefix ending in "-log-"
driver=${tmp%.*}   # remove suffix starting with ".csv"

output=out/clean/clean-log-$driver.csv

# Write header
grep -m 1 Driver $filename > $output

# Write clean log
grep -o '^[^#]*' $filename >> $output