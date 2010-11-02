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
for f in $PRGDIR/data/*.txt; do
    echo "Processing $f"
    echo $PRGDIR/ppiparser.py "$f" $PRGDIR/data/nicknames.csv
    $PRGDIR/ppiparser.py "$f" $PRGDIR/data/nicknames.csv
done
