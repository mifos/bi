package org.mifos.bi;

import static org.junit.Assert.*
import org.junit.Test

class ExamplePrptReportTest {
    @Test
    void testDataDumpReport() {
        new PrptReport().execute () { t ->
            // Report settings.
            t.reportPath = 'src/test/resources/Simple.prpt'
            t.reportParams = ['dummyParamName': 'dummyParamValue']
            // Output data tests. NOTE: use 1-based indices!
            t.assertCellEquals(1, 1, "Customer ID")
            t.assertCellEquals(1, 2, "Customer Status")
            t.assertRowEquals(2, ['1'])
        }
    }
}
