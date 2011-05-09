SET DWPATH=C:\dev\businessIntelligenceRepo\bi\ETL\MifosDataWarehouseETL\

cd %DWPATH%

echo CREATE DATABASE %1;  > createdb.sql
mysql -u%2 -p%3 < createdb.sql
mysql -u%2 -p%3 %1 < load_mifos_datawarehouse.sql
mysql -u%2 -p%3 %1 < load_mifos_datawarehouse_stored_procedures.sql
mysql -u%2 -p%3 %1 < load_ppi_poverty_lines.sql
mysql -u%2 -p%3 %1 --default_character_set utf8 < load_dw_ppi_survey.sql

del createdb.sql

