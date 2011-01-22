#!/bin/sh

/usr/bin/env | grep ^BUILD_ > BUILD_ENV.txt

set -e

/usr/bin/zip -r -x@build/exclude.txt mifos_bi-1.0.0.zip BUILD_ENV.txt README INSTALL LICENSE ETL/MifosDataWarehouseETL reports
