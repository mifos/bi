#!/bin/bash
set -o errexit

#usage: XXX <PDI_HOME> <PDI_JOB> <OUTPUT_FILE>
PDI_HOME=$1
BI_GIT=$2
OUTPUT_FILE=$3


$PDI_HOME/kitchen.sh /file:$BI_GIT/ETL/MifosDataWarehouseETLTest/TestVerifyHealthChecks.kjb 1> tmplog.log

grep "Pass:" tmplog.log > $OUTPUT_FILE
grep "Fail:" tmplog.log >> $OUTPUT_FILE

rm tmplog.log

echo " "
echo " "
echo " "
echo "Listing Pass and Fail Info..."

cat $OUTPUT_FILE


exit $exitcode
