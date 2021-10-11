#!/bin/bash
# Perform planning search to recognize driver activity

cd ..
for filename in `ls hpdl/problems/problem-driver*.pddl | sort -V | tail -n +1`; do
    echo "Recognizing driver activity for file $filename..."

    # Get driver name
    tmp=${filename#*-}   # remove prefix ending in "_"
    driver=${tmp%.*}   # remove suffix starting with "_"

    ./planner/planner -d hpdl/domain.pddl -p $filename -o out/log-recognized/log-$driver.csv

    echo "$filename Completed!"
done;