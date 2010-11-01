#!/bin/sh

export PYTHONPATH=$BI_HOME/ppiparser/pylib
cd $BI_HOME/ppiparser/data/percents
for f in *.csv; do
    echo "Processing $f"
    $BI_HOME/ppiparser/plines_parser.py "$f"
done
