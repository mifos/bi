#!/bin/bash
# necessary due to http://jira.pentaho.com/browse/PDI-5076
set -ex
cd $1
shift
exec $*
