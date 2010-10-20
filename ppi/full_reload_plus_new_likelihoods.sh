#!/bin/bash
#
#drop and recreate the DW and then recreate and reload PPI tables
#
#usage: full_reload <DB_NAME> <PENTAHO_HOME> <BI_HOME>
#example: full_reload mifos_ppi_dw ~/pentaho ~/reportingWorkspace/bi

set -o errexit
DB_NAME=$1
PENTAHO_HOME=$2
PDI_HOME=${PENTAHO_HOME}/data-integration
BI_HOME=$3
echo $DB_NAME
echo "drop database ${DB_NAME}" | mysql -u root
echo "create database ${DB_NAME}" | mysql -u root
mysql -u root ${DB_NAME} < ../JohnWoodlockWorkInProgress/MifosDataWarehouseETL/load_mifos_datawarehouse.sql

# while there is work in progress, load new category likelihoods here
mysql -u root ${DB_NAME} < categoryLikelihoodsIndia02.sql


${PDI_HOME}/kitchen.sh /file:${BI_HOME}/JohnWoodlockWorkInProgress/MifosDataWarehouseETL/CreateDataWarehouse.kjb


