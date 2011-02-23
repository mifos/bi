package org.mifos.bi.test

import org.junit.Test

class OutreachSummaryBranchTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Outreach Summary by Branch'
    def detailsHeader = ['Branch', 'Centers', 'Groups', 'Active Clients', 'Active Borrowers', 'Active Depositors', 'Dropouts', 'No. of Loan Officers']

    def details1 = ['Mifos HO', '0', '0', '0', '0', '0', '0', '1']
    def details2 = ['br2', '3', '5', '8', '1', '2', '0', '1']
    def details3 = ['br4', '3', '3', '2', '0', '1', '1', '1']
    def details4 = ['RO dw1', '0', '0', '0', '0', '0', '0', '1']
    def details5 = ['br3', '0', '0', '0', '0', '0', '0', '0']
    def details6 = ['BO 1', '6', '23', '49', '0', '6', '0', '3']
    def total = ['Total', '12', '31', '59', '1', '9', '1', '7']

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
            t.assertRowEquals(offset+5, details5)
            t.assertRowEquals(offset+6, details6)
            // Group footer
            t.assertRowEquals(offset+7, total)

            // Page footer
            offset = 11 
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
