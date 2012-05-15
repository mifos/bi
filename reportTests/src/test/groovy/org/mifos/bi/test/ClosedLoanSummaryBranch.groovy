package org.mifos.bi.test

import org.junit.Test

class ClosedLoanSummaryBranchTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Closed Loan Summary per Branch'
    def detailsHeader = ['Branch', 'No. of Centers with Closed Loans', 'No. of Groups with Closed Loans', 'No. of Clients with Closed Loans', 'No. of Closed Loans', 'Total Amount of Closed Loans', 'Total Interest Repaid']

    def details = ['BO 1', '2', '3', '3', '3', '12000.0000', '5.8000']
    def total = ['Total', '2', '3', '3', '3', '12000.0000', '5.8000']

    def pageFooter = ['Version 1.3.1', 'Page', '1 / 1']

    @Test
    void testParams_() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/ClosedLoanSummaryBranch.prpt'

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Group header
            def offset = 3
            // Details header
            t.assertRowEquals(offset, detailsHeader)
            // Details
            t.assertRowEquals(offset+1, details)
            // Group footer
            t.assertRowEquals(offset+2, total)

            // Page footer
            offset = 6
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
