#!/bin/bash
#

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
PDI_HOME="$1"
UPTO_DATE="$2"
$PDI_HOME/kitchen.sh /file:`readlink -f $PRGDIR/CompareDatabaseTables.kjb`
