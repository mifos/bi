package org.mifos.bi.test

import org.junit.Test

class ActiveLoanSummaryBranchTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Active Loan Summary per Branch'
    def detailsHeader = ['Branch', 'No. of Centers', 'No. of Groups', 'No. of Clients', 'No. of Active Loans', 'No. of Loans in Arrears', 'Total Loans Disbursed', 'Total Principal Repaid', 'Total Interest Repaid', 'Total Principal Outstanding', 'Total Interest Outstanding', 'Amount in Arrears']

    def details = ['br2', '2', '10', '9', '1', '1', '3000.0000', '75.1000', '2.9000', '2924.9000', '18.1000', '2943.0000']
    def total = ['Total', '2', '10', '9', '1', '1', '3000.0000', '75.1000', '2.9000', '2924.9000', '18.1000', '2943.0000']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_All_All_20110211() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/ActiveLoanSummaryBranch.prpt'
            t.reportParams = ['out_date': '2011-02-11']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2011-02-11'])

            // Group header
            def offset = 4
            // Details header
            t.assertRowEquals(offset, detailsHeader)
            // Details -> 2010-07-21
            t.assertRowEquals(offset+1, details)
            // Group footer
            t.assertRowEquals(offset+2, total)

            // Page footer
            offset = 7
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
