package org.mifos.bi.test

import org.junit.Test

class DueVsCollectedBranchTest {

    def reportName = 'Due vs Collected by Branch'
    def detailsHeader = ['Repayment Date', 'Principal Due', 'Interest Due', 'Principal Arrears Due', 'Interest Arrears Due', 'Principal Collected', 'Interest Collected']

    def firstBranch = ['Branch:', 'BO 1']
    def detailsBO1_20100718 = ['2010-07-18', '0.0000', '0.0000', '0.0000', '0.0000', '517.2000', '5.8000']
    def detailsBO1_20100724 = ['2010-07-24', '0.0000', '0.0000', '0.0000', '0.0000', '3000.0000', '2.9000']
    def totalBO1 = ['Total', '0.0000', '0.0000', '-', '-', '3517.2000', '8.7000']

    def secondBranch = ['Branch:', 'br2']
    def detailsbr2_20100721 = ['2010-07-21', '0.0000', '0.0000', '0.0000', '0.0000', '75.1000', '2.9000']
    def detailsbr2_20100803 = ['2010-08-03', '428.1000', '2.9000', '0.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100810 = ['2010-08-10', '428.1000', '2.9000', '353.0000', '0.0000', '0.0000', '0.0000']
    def detailsbr2_20100817 = ['2010-08-17', '428.1000', '2.9000', '781.1000', '2.9000', '0.0000', '0.0000']
    def detailsbr2_20100824 = ['2010-08-24', '428.1000', '2.9000', '1209.2000', '5.8000', '0.0000', '0.0000']
    def detailsbr2_20100831 = ['2010-08-31', '428.1000', '2.9000', '1637.3000', '8.7000', '0.0000', '0.0000']
    def detailsbr2_20100907 = ['2010-09-07', '428.1000', '2.9000', '2065.4000', '11.6000', '0.0000', '0.0000']
    def detailsbr2_20100914 = ['2010-09-14', '431.4000', '3.6000', '2493.5000', '14.5000', '0.0000', '0.0000']
    def totalbr2 = ['Total', '3000.0000', '21.0000', '-', '-', '75.1000', '2.9000']
    def totalbr2_20100915 = ['Total', '856.2000', '5.8000', '-', '-', '75.1000', '2.9000']

    def thirdBranch = ['Branch:', 'br4']
    def detailsbr4_20100828 = ['2010-08-28', '0.0000', '0.0000', '0.0000', '0.0000', '621.3000', '7.7000']
    def totalbr4 = ['Total', '0.0000', '0.0000', '-', '-', '621.3000', '7.7000']

    def grandTotalbr2_20100701_20100815 = ['Grand Total', '856.2000', '5.8000', '-', '-', '75.1000', '2.9000']
    def grandTotalbr2_20100701_20100930 = ['Grand Total', '3000.0000', '21.0000', '-', '-', '75.1000', '2.9000']
    def grandTotal_20100701_20100930 = ['Grand Total', '3000.0000', '21.0000', '-', '-', '4213.6000', '19.3000']
    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_All_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedBranch.prpt'
            t.reportParams = ['selected_office': '-1', 'start_date': '2010/07/01 00:00:00.000', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertCellEquals(2, 1, 'Date:')
            t.assertCellEquals(2, 2, 'From:')
            // TODO t.assertCellEquals(2, 3, '2010-07-01')
            t.assertCellEquals(2, 4, 'MFI Name:')
            t.assertCellEquals(2, 5, 'Mifos HO')
            t.assertCellEquals(3, 1, 'To:')
            // TODO t.assertCellEquals(3, 2, '2010-09-30')
            t.assertCellEquals(3, 2, 'Report Date:')

            // 1st Group header
            def offset = 4
            t.assertRowEquals(offset, firstBranch)
            // 1st Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: BO 1 -> 2010-07-18
            t.assertRowEquals(offset+2, detailsBO1_20100718)
            // Branch: BO 1 -> 2010-07-24
            t.assertRowEquals(offset+3, detailsBO1_20100724)
            // 1st Group footer
            t.assertRowEquals(offset+4, totalBO1)

            // 2nd Group header
            offset = 9
            t.assertRowEquals(offset, secondBranch)
            // 2nd Details header
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

            // 3rd Group header
            offset = 20
            t.assertRowEquals(offset, thirdBranch)
            // 2nd Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: br4 -> 2010-08-28
            t.assertRowEquals(offset+2, detailsbr4_20100828)
            // 3rd Group footer
            t.assertRowEquals(offset+3, totalbr4)

            // Report footer
            offset = 24
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, grandTotal_20100701_20100930)
            // Page footer
            offset = 26
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
        }
    }

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedBranch.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010/07/01 00:00:00.000', 'end_date': '2010-09-30']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertCellEquals(2, 1, 'Date:')
            t.assertCellEquals(2, 2, 'From:')
            // TODO t.assertCellEquals(2, 3, '2010-07-01')
            t.assertCellEquals(2, 4, 'MFI Name:')
            t.assertCellEquals(2, 5, 'Mifos HO')
            t.assertCellEquals(3, 1, 'To:')
            // TODO t.assertCellEquals(3, 2, '2010-09-30')
            t.assertCellEquals(3, 2, 'Report Date:')

            // Group header
            def offset = 4
            t.assertRowEquals(offset, secondBranch)
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
            // Group footer
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
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedBranch.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010/07/01 00:00:00.000', 'end_date': '2010-08-15']

            // Report title
            t.assertRowEquals(1, [reportName])

            // Page header
            t.assertCellEquals(2, 1, 'Date:')
            t.assertCellEquals(2, 2, 'From:')
            // TODO t.assertCellEquals(2, 3, '2010-07-01')
            t.assertCellEquals(2, 4, 'MFI Name:')
            t.assertCellEquals(2, 5, 'Mifos HO')
            t.assertCellEquals(3, 1, 'To:')
            // TODO t.assertCellEquals(3, 2, '2010-09-30')
            t.assertCellEquals(3, 2, 'Report Date:')

            // Group header
            def offset = 4
            t.assertRowEquals(offset, secondBranch)
            // Details header
            t.assertRowEquals(offset+1, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+2, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+3, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+4, detailsbr2_20100810)
            // Group footer
            t.assertRowEquals(offset+5, totalbr2_20100915)

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
