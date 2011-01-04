package org.mifos.bi.test;

import org.junit.Test

class DueVsCollectedLoanOfficerTest {

    def detailsHeader = ['Repayment Date', 'Principal Due', 'Interest Due', 'Principal Arrears Due', 'Interest Arrears Due', 'Principal Collected', 'Interest Collected']

    def firstLoanOfficer = ['Loan Officer', ':', 'br2 LO xxx']
    def detailsbr2_20100721 = ['2010-07-21', '0.0000', '0.0000', '0.0000', '0.0000', '75.1000', '2.9000']
    def detailsbr2_20100803 = ['2010-08-03', '428.1000', '2.9000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100810 = ['2010-08-10', '428.1000', '2.9000', '353.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100817 = ['2010-08-17', '428.1000', '2.9000', '781.1000', '2.9000', '0.0000', '0.0000']
    def detailsbr2_20100824 = ['2010-08-24', '428.1000', '2.9000', '1209.2000', '5.8000', '0.0000', '0.0000']
    def detailsbr2_20100831 = ['2010-08-31', '428.1000', '2.9000', '1637.3000', '8.7000', '0.0000', '0.0000']
    def detailsbr2_20100907 = ['2010-09-07', '428.1000', '2.9000', '2065.4000', '11.6000', '0.0000', '0.0000']
    def detailsbr2_20100914 = ['2010-09-14', '431.4000', '3.6000', '2493.5000', '14.5000', '0.0000', '0.0000']
    def totalbr2 = ['Total', '3000.0000', '21.0000', '-', '-', '75.1000', '2.9000']
    def totalbr2_20100815 = ['Total', '856.2000', '5.8000', '-', '-', '75.1000', '2.9000']

    def grandTotalbr2_20100701_20100815 = ['GrandTotal', '856.2000', '5.8000', '-', '-', '75.1000', '2.9000']
    def grandTotalbr2_20100701_20100930 = ['GrandTotal', '3000.0000', '21.0000', '-', '-', '75.1000', '2.9000']
    def pageFooter = ['Version1.1', 'Page 1 / 1']

    @Test
    void testParams_br2_All_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedLoanOfficer.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '-1', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, ['Due vs Collected Report by Loan Officer'])

            // Page header
            t.assertCellEquals(2, 1, 'Date')
            t.assertCellEquals(2, 2, ':')
            t.assertCellEquals(2, 3, 'From')
            t.assertCellEquals(2, 4, ':')
            // TODO t.assertCellEquals(2, 5, '2010-07-01')
            t.assertCellEquals(2, 5, 'To')
            t.assertCellEquals(2, 6, ':')
            // TODO t.assertCellEquals(2, 8, '2010-09-30')
            t.assertCellEquals(2, 7, 'Report Date')

            // Group header
            t.assertRowEquals(3, firstLoanOfficer)
            // Details header
            t.assertRowEquals(4, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(5, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(6, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(7, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(8, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(9, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(10, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(11, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(12, detailsbr2_20100914)
            // 2nd Group footer
            t.assertRowEquals(13, totalbr2)

            // Report footer
            t.assertRowEquals(14, detailsHeader)
            t.assertRowEquals(15, grandTotalbr2_20100701_20100930)
            // Page footer
            t.assertRowEquals(16, pageFooter)
        }
    }

    @Test
    void testParams_br2_br2LOxxx_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedLoanOfficer.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '5', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, ['Due vs Collected Report by Loan Officer'])

            // Page header
            t.assertCellEquals(2, 1, 'Date')
            t.assertCellEquals(2, 2, ':')
            t.assertCellEquals(2, 3, 'From')
            t.assertCellEquals(2, 4, ':')
            // TODO t.assertCellEquals(2, 5, '2010-07-01')
            t.assertCellEquals(2, 5, 'To')
            t.assertCellEquals(2, 6, ':')
            // TODO t.assertCellEquals(2, 8, '2010-09-30')
            t.assertCellEquals(2, 7, 'Report Date')

            // Group header
            t.assertRowEquals(3, firstLoanOfficer)
            // Details header
            t.assertRowEquals(4, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(5, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(6, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(7, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(8, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(9, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(10, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(11, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(12, detailsbr2_20100914)
            // 2nd Group footer
            t.assertRowEquals(13, totalbr2)

            // Report footer
            t.assertRowEquals(14, detailsHeader)
            t.assertRowEquals(15, grandTotalbr2_20100701_20100930)
            // Page footer
            t.assertRowEquals(16, pageFooter)
        }
    }

    @Test
    void testParams_br2_All_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedLoanOfficer.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '-1', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, ['Due vs Collected Report by Loan Officer'])

            // Page header
            t.assertCellEquals(2, 1, 'Date')
            t.assertCellEquals(2, 2, ':')
            t.assertCellEquals(2, 3, 'From')
            t.assertCellEquals(2, 4, ':')
            // TODO t.assertCellEquals(2, 5, '2010-07-01')
            t.assertCellEquals(2, 5, 'To')
            t.assertCellEquals(2, 6, ':')
            // TODO t.assertCellEquals(2, 8, '2010-08-15')
            t.assertCellEquals(2, 7, 'Report Date')

            // Group header
            t.assertRowEquals(3, firstLoanOfficer)
            // Details header
            t.assertRowEquals(4, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(5, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(6, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(7, detailsbr2_20100810)
            // 2nd Group footer
            t.assertRowEquals(8, totalbr2_20100815)

            // Report footer
            t.assertRowEquals(9, detailsHeader)
            t.assertRowEquals(10, grandTotalbr2_20100701_20100815)
            // Page footer
            t.assertRowEquals(11, pageFooter)
        }
    }
}
