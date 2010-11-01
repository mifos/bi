#!/bin/bash
#
#drop and recreate the DW and then recreate and reload PPI tables
#
#usage: full_reload <DB_NAME> <PDI_HOME> <BI_HOME>
#example: full_reload mifos_ppi_dw ~/pentaho-data-integration ~/reportingWorkspace/bi

set -o errexit
DB_NAME=$1
PDI_HOME=$2
BI_HOME=$3
MYSQL_ARGS="-u root"
echo $DB_NAME
echo "drop database $DB_NAME" | mysql $MYSQL_ARGS
echo "create database $DB_NAME" | mysql $MYSQL_ARGS
mysql $MYSQL_ARGS ${DB_NAME} < ${BI_HOME}/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/load_mifos_datawarehouse.sql

# while there is work in progress, load new category likelihoods here
mysql $MYSQL_ARGS ${DB_NAME} < /tmp/RomaniaPovertyLines.sql


${PDI_HOME}/kitchen.sh /file:${BI_HOME}/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/CreateDataWarehouse.kjb


