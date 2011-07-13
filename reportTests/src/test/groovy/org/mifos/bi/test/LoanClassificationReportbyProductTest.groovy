package org.mifos.bi.test

import org.junit.Test

class LoanClassificationReportbyProductTest {

    def mfiName = 'Mifos HO'
    def reportPath = 'reports/standardReports/prpts/LoanClassificationProduct.prpt'
    def reportName = 'Loan Classification by Product'
    def detailsHeader1 = [' ', 'During Period', 'Cumulative', 'End of Period']
    def detailsHeader2 = ['Product Name', '# of Loans Disbursed', 'Amount Disbursed',
            '# of Loans Disbursed', 'Amount Disbursed',
            'Amount Outstanding', 'Arrears Amount', 'PAR',
            '# of Active Loans', '% of Portfolio Amount']

    def office = ['Office:', 'br2']
    def detailsbr2_grouploan = ['group loan', '0', '0.0000', '0', '0.0000', '0.0000', '0.0000', '0', '0.00']
    def detailsbr2_loanprod1_20100815 = ['loan prod 1', '1', '3000.0000', '1', '3000.0000', '2924.9000', '781.1000', '100.00', '1', '100.00']
    def detailsbr2_loanprod1_20100930 = ['loan prod 1', '1', '3000.0000', '1', '3000.0000', '2924.9000', '2924.9000', '100.00', '1', '100.00']
    def detailsbr2_loanprod2 = ['loan prod 2', '0', '0.0000', '0', '0.0000', '0.0000', '0.0000', '0', '0.00']
    def totalbr2_20100815 = ['Total', '1', '3000.0000', '1', '3000.0000', '2924.9000', '781.1000', '100.00000000000000', '1', '100.00']
    def totalbr2_20100930 = ['Total', '1', '3000.0000', '1', '3000.0000', '2924.9000', '2924.9000', '100.00000000000000', '1', '100.00']

    def pageFooter = ['Version 1.3', 'Page', '1 / 1']

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-09-30')
            t.assertRowEquals(5, office)

            // Details header
            def offset = 6
            t.assertRowEquals(offset, detailsHeader1)
            t.assertRowEquals(offset+1, detailsHeader2)
            // group loan
            t.assertRowEquals(offset+2, detailsbr2_grouploan)
            // loan prod 1
            t.assertRowEquals(offset+3, detailsbr2_loanprod1_20100930)
            // loan prod 2
            t.assertRowEquals(offset+4, detailsbr2_loanprod2)
            // 1st Group footer
            t.assertRowEquals(offset+5, totalbr2_20100930)

            // Page footer
            offset = 12
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = reportPath
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-08-15')
            t.assertRowEquals(5, office)

            // Details header
            def offset = 6
            t.assertRowEquals(offset, detailsHeader1)
            t.assertRowEquals(offset+1, detailsHeader2)
            // group loan
            t.assertRowEquals(offset+2, detailsbr2_grouploan)
            // loan prod 1
            t.assertRowEquals(offset+3, detailsbr2_loanprod1_20100815)
            // loan prod 2
            t.assertRowEquals(offset+4, detailsbr2_loanprod2)
            // 1st Group footer
            t.assertRowEquals(offset+5, totalbr2_20100815)

            // Page footer
            offset = 12
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
