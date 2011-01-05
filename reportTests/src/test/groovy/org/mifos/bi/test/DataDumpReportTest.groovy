package org.mifos.bi.test

import org.junit.Test

class DataDumpReportTest {
    @Test
    void testDataDumpReport() {
        new PrptReport().execute () { t ->
            t.reportPath = 'standardReports/PPIDataDumpReport.prpt'
            t.reportParams = [
                'startDate': 'dummyParamValue',
                'endDate': 'dummyParamValue',
            ]
            t.assertCellEquals(1, 1, "Client Name")
        }
    }
}
