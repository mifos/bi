package org.mifos.bi.test

import static org.junit.Assert.*
import org.junit.Test

class ClientExitTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Client Exit'

    @Test
    void testReport() {
        new PrptReport().execute () { t ->
            t.reportPath = 'reports/standardReports/prpts/ClientExit.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '-1', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])
        }
    }
}
