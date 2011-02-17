package org.mifos.bi.test

import org.junit.Test

class ActiveLoansLoanPurposeTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Active Loans by Loan Purpose'
    def detailsHeader = ['System Id', 'Center Name', 'Group Name', 'Client Name', 'Loan Amount', 'Interest Rate', 'Disbursal Date', 'Repaid Principal', 'Repaid Interest', 'Outstanding Principal', 'Outstanding Interest', 'Loan Officer']

    def center = ['Loan Purpose:', 'n/a'] 
    def details = ['32', 'br2 center 1', 'br2 group 1', 'br2 client 1 xxx', '3000.0000', '5.0000000000', '2010-07-21', '75.1000', '2.9000', '2924.9000', '18.1000', 'br2 LO xxx']
    def total = ['Total', '', '', '', '3000.0000', '', '', '75.1000', '2.9000', '2924.9000', '18.1000', '']

    def pageFooter = ['Version 1.2', 'Page', '1 / 1']

    @Test
    void testParams_All_All_20110112() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/ActiveLoansLoanPurpose.prpt'
            t.reportParams = ['selected_office': '-1', 'selected_purpose': '-1', 'out_date': '2011-01-12']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertRowEquals(3, ['As Of:', '2011-01-12'])
            t.assertRowEquals(4, ['Office:', 'All'])
            t.assertRowEquals(5, ['Loan Purpose:', 'All'])

            // Group header
            def offset = 6
            t.assertRowEquals(offset, center)
            // Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Details -> 2010-07-21
            t.assertRowEquals(offset+2, details)
            // Group footer
            t.assertRowEquals(offset+3, total)

            // Page footer
            offset = 10
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
