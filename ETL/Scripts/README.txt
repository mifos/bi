Before and After Checks on the Mifos OLTP and Data Warehouse Databases
======================================================================

Mifos OLTP Database Pre-ETL Check
---------------------------------
Run script mifosPrecheck.sql to see if any blocking and/or warning data quality issues are likely to come up when creating the Data Warehouse from the Mifos database.

mysql -uUSER -pPASSWORD OLTP_DATABASENAME < mifosPrecheck.sql > mifosPrecheck.out

For blocking issues (and further information on any warning issues) community members should contact the mifos developer list. 

Typical problems highlighted include creating accounts before the corresponding clients, lack of account status history, duplicate fees and loan officers... mostly due to initial migration into mifos needs or moving the system data backwards and forwards.


Data Warehouse Data Quality Check
---------------------------------
The mifos data warehouse suite comes with a job that will check your data warehouse data quality.

In ubuntu,

bash bi/data_warehouse_health_check.sh <PDI_HOME> <PDI_JOB> <OUTPUT_FILE>

e.g. bash bi/data_warehouse_health_check.sh /opt/pentaho/data-integration /home/ubuntu/bi passfail.log




Trouble-Shooting if ETL Job Fails
=================================
If the job that brings mifos data into the data warehouse fails... run the script mifosUnsuccessfulETL.sql

mysql -uUSER -pPASSWORD DATAWAREHOUSE_DATABASENAME < mifosUnsuccessfulETL.sql > mifosUnsuccessfulETL.out

Typical problems highlighted include creating clients before groups.

Community members should contact the mifos developer list with the output and may need to supply a copy of the mifos database and incomplete data warehouse database for further trouble shooting.