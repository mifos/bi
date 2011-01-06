package org.mifos.bi.test;

import org.junit.Test

class LoanClassificationReportbyProductTest {

    def detailsHeader = ['Product Name', '# of Loans Disbursed (during period)', 'Amount Disbursed (during period)',
            'Amount Outstanding (end of period)', 'Arrears (end of period)', 'PAR (end of period)',
            '# of Loans Disbursed (end of period)', 'Amount of Loans Disbursed (end of period)',
            '# of Active Loans (end of period)', '% of Portfolio (end of period)']

    def office = ['Office:', 'br2', 'MFI Name:', 'Mifos HO']
    def byProductType = ['By Product Type']
    def detailsbr2_grouploan = ['group loan', '0', '0.0000', '0.0000', '0.0000', '0', '0.0000', '0', '0.00']
    def detailsbr2_loanprod1_20100815 = ['loan prod 1', '1', '3000.0000', '2924.9000', '781.1000', '100.00', '1', '3000.0000', '1', '100.00']
    def detailsbr2_loanprod1_20100930 = ['loan prod 1', '1', '3000.0000', '2924.9000', '2924.9000', '100.00', '1', '3000.0000', '1', '100.00']
    def detailsbr2_loanprod2 = ['loan prod 2', '0', '0.0000', '0.0000', '0.0000', '0', '0.0000', '0', '0.00']
    def totalbr2_20100815 = ['Total', '1', '3000.0000', '2924.9000', '781.1000', '100.00000000000000', '1', '3000.0000', '1', '100.00']
    def totalbr2_20100930 = ['Total', '1', '3000.0000', '2924.9000', '2924.9000', '100.00000000000000', '1', '3000.0000', '1', '100.00']

    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanClassificationReportbyProduct.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, ['Loan Classification Report by Product'])

            // Page header
            t.assertRowEquals(2, office)
            t.assertCellEquals(3, 1, 'Date Range:')
            t.assertCellEquals(3, 2, 'From:')
            // TODO t.assertCellEquals(3, 3, '2010-07-01')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-09-30')

            // Group header
            def offset = 5
            t.assertRowEquals(offset, byProductType)
            // Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // group loan
            t.assertRowEquals(offset+2, detailsbr2_grouploan)
            // loan prod 1
            t.assertRowEquals(offset+3, detailsbr2_loanprod1_20100930)
            // loan prod 2
            t.assertRowEquals(offset+4, detailsbr2_loanprod2)
            // 1st Group footer
            t.assertRowEquals(offset+5, totalbr2_20100930)

            // Page footer
            offset = 11
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/LoanClassificationReportbyProduct.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, ['Loan Classification Report by Product'])

            // Page header
            t.assertRowEquals(2, office)
            t.assertCellEquals(3, 1, 'Date Range:')
            t.assertCellEquals(3, 2, 'From:')
            // TODO t.assertCellEquals(3, 3, '2010-07-01')
            t.assertCellEquals(3, 3, 'Report Date:')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-09-30')

            // Group header
            def offset = 5
            t.assertRowEquals(offset, byProductType)
            // Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // group loan
            t.assertRowEquals(offset+2, detailsbr2_grouploan)
            // loan prod 1
            t.assertRowEquals(offset+3, detailsbr2_loanprod1_20100815)
            // loan prod 2
            t.assertRowEquals(offset+4, detailsbr2_loanprod2)
            // 1st Group footer
            t.assertRowEquals(offset+5, totalbr2_20100815)

            // Page footer
            offset = 11
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }
}
