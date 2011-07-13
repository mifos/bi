package org.mifos.bi.test

import org.junit.Test

class DormantClientsSummaryTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Dormant Clients Summary'
    def detailsHeader = ['Branch', 'No. of Centers', 'No. of Groups', 'No. of Clients', 'No. of Clients without Active Loan', 'Longest Time without Loan', '% of Active Clients that are Dormant']

    def pageFooter = ['Version 1.3', 'Page', '1 / 1']

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
            t.assertCellEquals(offset+1, 1, 'BO 1')
            t.assertCellEquals(offset+1, 2, '5')
            t.assertCellEquals(offset+1, 3, '18')
            t.assertCellEquals(offset+1, 4, '21')
            t.assertCellEquals(offset+1, 5, '21')
            t.assertCellEquals(offset+1, 7, '100')

            t.assertCellEquals(offset+2, 1, 'br2')
            t.assertCellEquals(offset+2, 2, '2')
            t.assertCellEquals(offset+2, 3, '3')
            t.assertCellEquals(offset+2, 4, '4')
            t.assertCellEquals(offset+2, 5, '3')
            t.assertCellEquals(offset+2, 7, '75.00')

            t.assertCellEquals(offset+3, 1, 'br4')
            t.assertCellEquals(offset+3, 2, '3')
            t.assertCellEquals(offset+3, 3, '2')
            t.assertCellEquals(offset+3, 4, '1')
            t.assertCellEquals(offset+3, 5, '1')
            t.assertCellEquals(offset+3, 7, '100')
            // Group footer
            t.assertCellEquals(offset+4, 1, 'Total')
            t.assertCellEquals(offset+4, 2, '10')
            t.assertCellEquals(offset+4, 3, '23')
            t.assertCellEquals(offset+4, 4, '26')
            t.assertCellEquals(offset+4, 5, '25')
            t.assertCellEquals(offset+4, 7, '96.1538461538461538461538461538461538')

            // Page footer
            offset = 8 
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
