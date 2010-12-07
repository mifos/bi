#!/bin/bash
set -o errexit

#usage: <DW_DB_NAME> <PDI_HOME> <MYSQL_ARGS>
DW_DB_NAME=$1
PDI_HOME=$2
MYSQL_ARGS=$3

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

echo "Initializing data warehouse ($DW_DB_NAME)..."
echo "drop database $DW_DB_NAME" | mysql $MYSQL_ARGS
echo "create database $DW_DB_NAME" | mysql $MYSQL_ARGS
mysql $MYSQL_ARGS $DW_DB_NAME < $PRGDIR/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/load_mifos_datawarehouse.sql

echo "Running ETL..."
log=`mktemp`
$PDI_HOME/kitchen.sh /file:`readlink -f $PRGDIR/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/DataWarehouseInitialLoad.kjb` | tee $log

exitcode=0
if grep -q '^ERROR ' $log
then
    echo ETL Has Errors
    exitcode=1
    rm $log
fi
exit $exitcode
