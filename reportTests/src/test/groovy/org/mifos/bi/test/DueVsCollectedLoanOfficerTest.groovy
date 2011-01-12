package org.mifos.bi.test

import org.junit.Test

class DueVsCollectedLoanOfficerTest {

    def reportName = 'Due vs Collected by Loan Officer'
    def detailsHeader = ['Repayment Date', 'Principal Due', 'Interest Due', 'Principal Arrears Due', 'Interest Arrears Due', 'Principal Collected', 'Interest Collected']

    def firstLoanOfficer = ['Loan Officer:', 'br2 LO xxx']
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
    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_br2_All_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedLoanOfficer.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '-1', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertCellEquals(2, 1, 'Date:')
            t.assertCellEquals(2, 2, 'From:')
            // TODO t.assertCellEquals(2, 3, '2010-07-01')
            t.assertCellEquals(2, 3, 'MFI Name:')
            t.assertCellEquals(2, 4, 'Mifos HO')
            t.assertCellEquals(3, 1, 'To:')
            // TODO t.assertCellEquals(3, 2, '2010-09-30')
            t.assertCellEquals(3, 2, 'Report Date:')

            // Group header
            def offset = 4
            t.assertRowEquals(offset, firstLoanOfficer)
            // Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+2, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+3, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+4, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(offset+5, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(offset+6, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(offset+7, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(offset+8, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(offset+9, detailsbr2_20100914)
            // 2nd Group footer
            t.assertRowEquals(offset+10, totalbr2)

            // Report footer
            offset = 15
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, grandTotalbr2_20100701_20100930)
            // Page footer
            offset = 17
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_br2_br2LOxxx_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedLoanOfficer.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '5', 'start_date': '2010-07-01', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertCellEquals(2, 1, 'Date:')
            t.assertCellEquals(2, 2, 'From:')
            // TODO t.assertCellEquals(2, 3, '2010-07-01')
            t.assertCellEquals(2, 3, 'MFI Name:')
            t.assertCellEquals(2, 4, 'Mifos HO')
            t.assertCellEquals(3, 1, 'To:')
            // TODO t.assertCellEquals(3, 2, '2010-09-30')
            t.assertCellEquals(3, 2, 'Report Date:')

            // Group header
            def offset = 4
            t.assertRowEquals(offset, firstLoanOfficer)
            // Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+2, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+3, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+4, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(offset+5, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(offset+6, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(offset+7, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(offset+8, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(offset+9, detailsbr2_20100914)
            // 2nd Group footer
            t.assertRowEquals(offset+10, totalbr2)

            // Report footer
            offset = 15
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, grandTotalbr2_20100701_20100930)
            // Page footer
            offset = 17
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_br2_All_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedLoanOfficer.prpt'
            t.reportParams = ['selected_office': '4', 'selected_loan_officer': '-1', 'start_date': '2010-07-01', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertCellEquals(2, 1, 'Date:')
            t.assertCellEquals(2, 2, 'From:')
            // TODO t.assertCellEquals(2, 3, '2010-07-01')
            t.assertCellEquals(2, 3, 'MFI Name:')
            t.assertCellEquals(2, 4, 'Mifos HO')
            t.assertCellEquals(3, 1, 'To:')
            // TODO t.assertCellEquals(3, 2, '2010-09-30')
            t.assertCellEquals(3, 2, 'Report Date:')

            // Group header
            def offset = 4
            t.assertRowEquals(offset, firstLoanOfficer)
            // Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+2, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+3, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+4, detailsbr2_20100810)
            // 2nd Group footer
            t.assertRowEquals(offset+5, totalbr2_20100815)

            // Report footer
            offset = 10
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, grandTotalbr2_20100701_20100815)
            // Page footer
            offset = 12
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }
}
