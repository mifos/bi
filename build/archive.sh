#!/bin/sh


/usr/bin/env | grep ^BUILD_ > BUILD_ENV.txt

set -e

/usr/bin/zip -r mifos_bi-1.1.0.zip BUILD_ENV.txt README INSTALL LICENSE ETL/MifosDataWarehouseETL reports
