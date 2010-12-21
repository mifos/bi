package org.mifos.bi.report.test

import org.junit.Test
import org.mifos.bi.test.PrptReport

class DataDumpReportTest {
    @Test
    void testDataDumpReport() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/ppiReports/DataDumpReport.prpt'
            t.reportParams = [
                'startDate': 'dummyParamValue',
                'endDate': 'dummyParamValue',
            ]
            t.assertCellEquals(1, 1, "Client Name")
        }
    }
}
