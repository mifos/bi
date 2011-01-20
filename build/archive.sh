#!/bin/sh

/usr/bin/env | grep ^BUILD_ > BUILD_ENV.txt

set -e

/usr/bin/zip -r -x@build/exclude.txt mifos_bi.zip BUILD_ENV.txt LICENSE ETL/MifosDataWarehouseETL reports
