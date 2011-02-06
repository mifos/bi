package org.mifos.bi.test

import org.junit.Test

class DataDumpReportTest {
    @Test
    void testDataDumpReport() {
        new PrptReport().executeFromKjb () { t ->
            t.reportPath = 'reports/ppiTest/PPIDataDumpJob.kjb'
            t.reportParams = [
                'startDate': '2010-01-01',
                'endDate': '2011-02-01',
            ]
            t.assertCellEquals(1, 1, "Customer Name")
        }
    }
}
