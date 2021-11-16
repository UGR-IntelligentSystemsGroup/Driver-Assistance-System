#!/bin/bash
# Generate PDDL problems for each driver PLAN and TaskSymbol files

for filename in `ls out/logs/event_log_driver*.plan | sort -V | tail -n +1`; do
    echo "Generating PDDL problem for $filename..."

    ./parsers/fromPLANtoPDDL.py $filename

    echo "Completed!"
done;