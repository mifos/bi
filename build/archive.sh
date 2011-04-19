#!/bin/sh


/usr/bin/env | grep ^BUILD_ > BUILD_ENV.txt

set -e

PREFIX=mifos_bi-1.2.0

mkdir ${PREFIX}
cp -r BUILD_ENV.txt README INSTALL LICENSE ETL/MifosDataWarehouseETL reports ${PREFIX}/
/usr/bin/zip -r ${PREFIX}.zip ${PREFIX}
