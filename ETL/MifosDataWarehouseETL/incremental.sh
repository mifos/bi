#!/bin/bash
#

if [ $# -lt 1 ]
then
    echo "Usage: `basename $0` <PDI_HOME> <UPTO_DATE>"
    exit 1
fi

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
$PDI_HOME/kitchen.sh /file:`readlink -f $PRGDIR/DataWarehouseIncrementalLoad.kjb` $UPTO_DATE
