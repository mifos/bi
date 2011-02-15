#!/bin/bash
set -o errexit

#usage: XXX <PDI_HOME> 
PDI_HOME=$1

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

echo "Running Data Warecheck Health Check..."
$PDI_HOME/kitchen.sh /file:`readlink -f $PRGDIR/ETL/MifosDataWarehouseETLTest/TestVerifyHealthChecks.kjb` | tee $log


exit $exitcode
