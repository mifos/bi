#!/bin/bash
set -o errexit

#usage: XXX <OLTP_DB_NAME> <DW_DB_NAME> <PDI_HOME> <MYSQL_ARGS>
OLTP_DB_NAME=$1
DW_DB_NAME=$2
PDI_HOME=$3
MYSQL_ARGS=$4

# set by Hudson
BI_HOME=$WORKSPACE

echo "Initializing OLTP database ($OLTP_DB_NAME)..."
echo "drop database $OLTP_DB_NAME" | mysql $MYSQL_ARGS
echo "create database $OLTP_DB_NAME" | mysql $MYSQL_ARGS
mysql $MYSQL_ARGS $OLTP_DB_NAME < $BI_HOME/JohnWoodlockWorkInProgress/MifosDataWarehouseETLTest/mifos_testetl_db.sql

echo "Initializing data warehouse ($DW_DB_NAME)..."
echo "drop database $DW_DB_NAME" | mysql $MYSQL_ARGS
echo "create database $DW_DB_NAME" | mysql $MYSQL_ARGS
mysql $MYSQL_ARGS $DW_DB_NAME < $BI_HOME/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/load_mifos_datawarehouse.sql

echo "Running ETL..."
log=`mktemp`
$PDI_HOME/kitchen.sh /file:$BI_HOME/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/CreateDataWarehouse.kjb | tee $log

echo "Running tests..."
$PDI_HOME/kitchen.sh /file:$BI_HOME/JohnWoodlockWorkInProgress/MifosDataWarehouseETLTest/TestDataWarehouseETL.kjb | tee -a $log

exitcode=0
if grep -q '^ERROR ' $log
then
    echo Errors found.
    exitcode=1
else
    echo No errors found.
fi

rm $log
exit $exitcode
