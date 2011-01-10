package org.mifos.bi.test

import static org.junit.Assert.*
import org.junit.Test

class ClientExitTest {
    def reportName = 'Client Exit Report'

    @Test
    void testReport() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '-1', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, [reportName])
        }
    }
}
