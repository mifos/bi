package org.mifos.bi.test

import org.junit.Test

class DormantClientsSummaryTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Dormant Clients Summary'
    def detailsHeader = ['Branch', 'No. of Centers', 'No. of Groups', 'No. of Clients', 'No. of Clients without Active Loan', 'Longest Time without Loan', '% of Active Clients that are Dormant']

    def details1 = ['br2', '2', '3', '4', '0', '0', '0']
    def details2 = ['br4', '3', '2', '1', '0', '0', '0']
    def details3 = ['BO 1', '5', '18', '21', '1', '173', '4.7619047619047619047619047619047619']
    def total = ['Total', '10', '23', '26', '1', '173', '3.8461538461538461538461538461538462']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DormantClientsSummary.prpt'

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
            // Group footer
            t.assertRowEquals(offset+4, total)

            // Page footer
            offset = 8 
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
