#!/bin/sh

export PYTHONPATH=$BI_HOME/ppiparser/pylib
cd $BI_HOME/ppiparser/data
for f in *.txt; do
    echo "Processing $f"
    $BI_HOME/ppiparser/ppiparser.py "$f"
done
