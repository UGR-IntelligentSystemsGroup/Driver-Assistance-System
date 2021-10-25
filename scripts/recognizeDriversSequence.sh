#!/bin/bash
# Perform planning search to recognize driver activity

start=$1

# If no starting point: set to first file
if [[ -z "$start" ]]; then
   start=1
fi

list=$(ls hpdl/problems/problem-driver*.pddl | sort -V | tail -n +${start})

for filename in $list; do
    echo "Recognizing driver activity for file $filename..."

    # Get driver name
    tmp=${filename#*-}   # remove prefix ending in "_"
    driver=${tmp%.*}   # remove suffix starting with "_"

    ./planner/planner -d hpdl/domain.pddl -p $filename -o out/logs-recognition/log-$driver.csv

    echo "$filename Completed!"
done;