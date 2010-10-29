#!/bin/sh

cd data
for f in *.txt; do
    echo "Processing $f"
    ../ppiparser.py "$f"
done
