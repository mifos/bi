#!/bin/sh

cd data/percents
for f in *.csv; do
    echo "Processing $f"
    ../../plines_parser.py "$f"
done
