#!/bin/bash
#
#clear out all data except seed data from the DW before
# dumping it to update the init sql script:
# (mysqldump --routines -u root mifos_ppi_dw > load_mifos_datawarehouse.sql)
#
#usage: clear_down_dw_tables.sh <DB_NAME>

DB_NAME=$1
mysql -u root ${DB_NAME} < ClearDownDWTables.sql
