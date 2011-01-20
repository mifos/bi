#!/bin/sh

set -e

/usr/bin/env | grep ^BUILD_ > BUILD_ENV.txt

/usr/bin/zip -r mifos_bi.zip BUILD_ENV.txt LICENSE ETL/MifosDataWarehouseETL reports
