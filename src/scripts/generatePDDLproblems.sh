#!/bin/bash
# Generate PDDL problems for each driver PLAN and TaskSymbol files

for filename in `ls out/plan/event-log-driver*.plan | sort -V | tail -n +1`; do
    echo "Generating PDDL problem for $filename..."

    ./src/parsers/fromPLANtoPDDL.py $filename

    echo "Completed!"
done;