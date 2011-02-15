#!/bin/bash
set -o errexit

#usage: XXX <PDI_HOME> 
PDI_HOME=/cygdrive/c/Users/Keith/Desktop/PentahoPlatform/pdi-ce-4.0.0-stable/data-integration/

echo "Running Data Warehouse Health Check..."
$PDI_HOME/kitchen.sh /file:/cygdrive/c/dev/businessIntelligenceRepo/bi/ETL/MifosDataWarehouseETLTest/TestVerifyHealthChecks.kjb | tee tmplog.log

grep "Pass:" tmplog.log
grep "Fail:" tmplog.log

rm tmplog.logw
exit $exitcode
