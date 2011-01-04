package org.mifos.bi.test;

import org.junit.Test

class LoanClassificationReportbyProductTest {

    def detailsHeader1 = ['Product Name', '# of Loans ', 'Amount ', 'Amount ', 'Arrears', 'PAR', '# of Loans ', 'Amount of Loans', '# of Active ', '% of Portfolio']
    def detailsHeader2 = ['Disbursed ', 'Disbursed ', 'Outstanding', '(end of period)', '(end of period)', 'Disbursed ', 'Disbursed ', 'Loans', '(end of']
    def detailsHeader3 = ['(during period)', '(during period)', '(end of period)', '(end of period)', '(end of period)', '(end of period)', 'period)']

    def office = ['Office', ':', 'br2']
    def byProductType = ['By Product Type']
    def detailsbr2_grouploan = ['group loan', '0', '0.0000', '0.0000', '0.0000', '0', '0.0000', '0', '0.00']
    def detailsbr2_loanprod1_20100815 = ['loan prod 1', '1', '3000.0000', '2924.9000', '781.1000', '100.00', '1', '3000.0000', '1', '100.00']
    def detailsbr2_loanprod1_20100930 = ['loan prod 1', '1', '3000.0000', '2924.9000', '2924.9000', '100.00', '1', '3000.0000', '1', '100.00']
    def detailsbr2_loanprod2 = ['loan prod 2', '0', '0.0000', '0.0000', '0.0000', '0', '0.0000', '0', '0.00']
    def totalbr2_20100815 = ['Total', '1', '3000.0000', '2924.9000', '781.1000', '100.00000000000000', '1', '3000.0000', '1', '100.00']
    def totalbr2_20100930 = ['Total', '1', '3000.0000', '2924.9000', '2924.9000', '100.00000000000000', '1', '3000.0000', '1', '100.00']

    def pageFooter = ['Version 1.1', 'Page 1 / 1']

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
            t.assertCellEquals(3, 1, 'Date Range')
            t.assertCellEquals(3, 2, ':')
            t.assertCellEquals(3, 3, 'From')
            t.assertCellEquals(3, 4, ':')
            // TODO t.assertCellEquals(2, 5, '2010-07-01')
            t.assertCellEquals(3, 5, 'To')
            t.assertCellEquals(3, 6, ':')
            // TODO t.assertCellEquals(2, 8, '2010-09-30')
            t.assertCellEquals(3, 7, 'Report Date')

            // Group header
            t.assertRowEquals(4, byProductType)
            // Details header
            t.assertRowEquals(5, detailsHeader1)
            t.assertRowEquals(6, detailsHeader2)
            t.assertRowEquals(7, detailsHeader3)
            // group loan
            t.assertRowEquals(8, detailsbr2_grouploan)
            // loan prod 1
            t.assertRowEquals(9, detailsbr2_loanprod1_20100930)
            // loan prod 2
            t.assertRowEquals(10, detailsbr2_loanprod2)
            // 1st Group footer
            t.assertRowEquals(11, totalbr2_20100930)

            // Page footer
            t.assertRowEquals(12, pageFooter)
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
            t.assertCellEquals(3, 1, 'Date Range')
            t.assertCellEquals(3, 2, ':')
            t.assertCellEquals(3, 3, 'From')
            t.assertCellEquals(3, 4, ':')
            // TODO t.assertCellEquals(2, 5, '2010-07-01')
            t.assertCellEquals(3, 5, 'To')
            t.assertCellEquals(3, 6, ':')
            // TODO t.assertCellEquals(2, 8, '2010-08-15')
            t.assertCellEquals(3, 7, 'Report Date')

            // Group header
            t.assertRowEquals(4, byProductType)
            // Details header
            t.assertRowEquals(5, detailsHeader1)
            t.assertRowEquals(6, detailsHeader2)
            t.assertRowEquals(7, detailsHeader3)
            // group loan
            t.assertRowEquals(8, detailsbr2_grouploan)
            // loan prod 1
            t.assertRowEquals(9, detailsbr2_loanprod1_20100815)
            // loan prod 2
            t.assertRowEquals(10, detailsbr2_loanprod2)
            // 1st Group footer
            t.assertRowEquals(11, totalbr2_20100815)

            // Page footer
            t.assertRowEquals(12, pageFooter)
        }
    }
}
