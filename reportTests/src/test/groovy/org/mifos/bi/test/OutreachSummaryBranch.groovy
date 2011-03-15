package org.mifos.bi.test

import org.junit.Test

class OutreachSummaryBranchTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Outreach Summary by Branch'
    def detailsHeader = ['Branch', 'Centers', 'Groups', 'Active Clients', 'Active Borrowers', 'Active Depositors', 'Dropouts', 'No. of Loan Officers']

    def details1 = ['br2', '2', '3', '4', '1', '2', '0', '1']
    def details2 = ['br4', '3', '2', '1', '0', '1', '1', '1']
    def details3 = ['br3', '0', '0', '0', '0', '0', '0', '0']
    def details4 = ['BO 1', '5', '18', '21', '0', '5', '0', '3']
    def total = ['Total', '10', '23', '26', '1', '8', '1', '5']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/OutreachSummaryBranch.prpt'

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Group header
            def offset = 3
            // Details header
            t.assertRowEquals(offset, detailsHeader)
            // Details
            t.assertRowEquals(offset+1, details1)
            t.assertRowEquals(offset+2, details2)
            t.assertRowEquals(offset+3, details3)
            t.assertRowEquals(offset+4, details4)
            // Group footer
            t.assertRowEquals(offset+5, total)

            // Page footer
            offset = 9 
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
