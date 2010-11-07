#!/bin/sh

PRG="$0"

while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`

export PYTHONPATH=$PRGDIR/pylib
for f in $PRGDIR/data/percents/*.csv; do
    echo "Processing $f"
    $PRGDIR/plines_parser.py "$f" "$PRGDIR/data/nicknames.csv"
done
mv *PovertyLines.sql generated/povertyLines
