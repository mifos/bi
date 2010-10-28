#!/bin/sh

cd data;
for f in *.txt; do ../ppiparser.py "$f"; done
