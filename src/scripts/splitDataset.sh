#!/bin/bash
# Split dataset into individual csv based on drivers

awk -F, 'NR==1 {h=$0; next} {f=$1".csv"} !($1 in p) {p[$1]; print h > f} {print >> f}' $1