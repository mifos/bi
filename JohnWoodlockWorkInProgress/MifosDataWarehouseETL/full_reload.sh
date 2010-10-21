#!/bin/bash
#
#drop and recreate the DW and then recreate and reload PPI tables
#
#usage: full_reload <DB_NAME> <PDI_HOME> <BI_HOME>
#example: full_reload mifos_ppi_dw ~/pentaho ~/reportingWorkspace/bi

DB_NAME=$1
PDI_HOME=$2
BI_HOME=$3
echo $DB_NAME
echo "drop database ${DB_NAME}" | mysql -u root
echo "create database ${DB_NAME}" | mysql -u root
mysql -u root ${DB_NAME} < $BI_HOME/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/load_mifos_datawarehouse.sql
${PDI_HOME}/kitchen.sh /file:${BI_HOME}/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/CreateDataWarehouse.kjb
