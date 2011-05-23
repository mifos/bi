#!/bin/bash
set -o errexit

#usage: XXX <OLTP_DB_NAME> <DW_DB_NAME> <PDI_HOME> <MYSQL_ARGS>
OLTP_DB_NAME=$1
DW_DB_NAME=$2
PDI_HOME=$3
MYSQL_ARGS=$4

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

echo "Initializing OLTP database ($OLTP_DB_NAME)..."
echo "drop database $OLTP_DB_NAME" | mysql $MYSQL_ARGS
echo "create database $OLTP_DB_NAME" | mysql $MYSQL_ARGS
mysql $MYSQL_ARGS $OLTP_DB_NAME < $PRGDIR/ETL/MifosDataWarehouseETLTest/load_testppi_db.sql

echo "Initializing data warehouse ($DW_DB_NAME)..."
echo "drop database $DW_DB_NAME" | mysql $MYSQL_ARGS
echo "create database $DW_DB_NAME" | mysql $MYSQL_ARGS
mysql $MYSQL_ARGS $DW_DB_NAME < $PRGDIR/ETL/MifosDataWarehouseETL/load_mifos_datawarehouse.sql
mysql $MYSQL_ARGS $DW_DB_NAME < $PRGDIR/ETL/MifosDataWarehouseETL/load_mifos_datawarehouse_stored_procedures.sql
mysql $MYSQL_ARGS $DW_DB_NAME --default_character_set utf8 < $PRGDIR/ETL/MifosDataWarehouseETL/load_dw_ppi_survey.sql

echo "Running ETL..."
log=`mktemp`
$PDI_HOME/kitchen.sh /file:`readlink -f $PRGDIR/ETL/MifosDataWarehouseETL/DataWarehouseInitialLoad.kjb` | tee $log

#A step which checks for the existance of a last_updated column returns an error which can be disregarded
sed '/Column [last_updated] doesn/d' $log > copyof.log
rm $log
mv copyof.log $log

exitcode=0
if grep -q '^ERROR ' $log
then
    echo ETL Has Errors
    exitcode=1
    rm $log
    exit $exitcode
fi

# echo "Running tests..."
# The following TestDataWarehouseETL job is commented out because...
# The intention was to combine bi-master build with this build but didn't finish ensuring the junit output from the
# TestDataWarehouseETL job was shown (so still 2 hudson jobs)
# Also, any data added for ETL tests would require the "Procedure for updating and running PPI tests" procedure in 
# http://mifosforge.jira.com/wiki/display/MIFOS/PPI+2010+Update+Process to be done - 
# $PDI_HOME/kitchen.sh /file:`readlink -f $PRGDIR/ETL/MifosDataWarehouseETLTest/TestDataWarehouseETL.kjb` | tee -a $log

mkdir -p target
groovy $PRGDIR/generate_junit_output.groovy < $log > target/junit_output.xml

if grep -q '^ERROR ' $log
then
    exitcode=1
fi

echo No errors found.

echo " "
rm $log
exit $exitcode
