package org.mifos.bi.test

import org.junit.Test

class ActiveLoanSummaryBranchTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Active Loan Summary per Branch'
    def detailsHeader = ['Branch', 'No. of Centers', 'No. of Groups', 'No. of Clients', 'No. of Active Loans', 'No. of Loans in Arrears', 'Total Loans Disbursed', 'Total Principal Repaid', 'Total Interest Repaid', 'Total Principal Outstanding', 'Total Interest Outstanding', 'Amount in Arrears']

    def details = ['br2', '1', '1', '1', '1', '0', '3000.0000', '75.1000', '2.9000', '2924.9000', '18.1000', '0.0000']
    def total = ['Total', '1', '1', '1', '1', '0', '3000.0000', '75.1000', '2.9000', '2924.9000', '18.1000', '0.0000']

    def pageFooter = ['Version 1.3', 'Page', '1 / 1']

    @Test
    void testParams_() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/ActiveLoanSummaryBranch.prpt'

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
