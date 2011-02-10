package org.mifos.bi.test

import org.junit.Test

class DueVsCollectedBranchTest {

    def mfiName = 'Mifos HO'
    def reportName = 'Due vs Collected by Branch'
    def columnHeader = ['Due', 'Collections']
    def detailsHeader = ['Repayment Date', 'Principal', 'Interest', 'F/P', 'Arrears Principal', 'Arrears Interest', 'Principal', 'Interest', 'F/P', 'Arrears Principal', 'Arrears Interest']

    def firstBranch = ['Office:', 'BO 1']
    def detailsBO1_20100718 = ['2010-07-18', '0.0000', '0.0000', '0.0', '0.0000', '0.0000', '517.2000', '5.8000', '0.0', '0.0', '0.0']
    def detailsBO1_20100724 = ['2010-07-24', '0.0000', '0.0000', '0.0', '0.0000', '0.0000', '3000.0000', '2.9000', '0.0', '0.0', '0.0']
    def totalBO1 = ['Total', '0.0000', '0.0000', '-', '-', '-', '3517.2000', '8.7000', '-', '-', '-']

    def secondBranch = ['Office:', 'br2']
    def detailsbr2_20100721 = ['2010-07-21', '0.0000', '0.0000', '0.0', '0.0000', '0.0000', '75.1000', '2.9000', '0.0', '0.0', '0.0']
    def detailsbr2_20100803 = ['2010-08-03', '428.1000', '2.9000', '0.0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0', '0.0', '0.0']
    def detailsbr2_20100810 = ['2010-08-10', '428.1000', '2.9000', '0.0', '353.0000', '0.0000', '0.0000', '0.0000', '0.0', '0.0', '0.0']
    def detailsbr2_20100817 = ['2010-08-17', '428.1000', '2.9000', '0.0', '781.1000', '2.9000', '0.0000', '0.0000', '0.0', '0.0', '0.0']
    def detailsbr2_20100824 = ['2010-08-24', '428.1000', '2.9000', '0.0', '1209.2000', '5.8000', '0.0000', '0.0000', '0.0', '0.0', '0.0']
    def detailsbr2_20100831 = ['2010-08-31', '428.1000', '2.9000', '0.0', '1637.3000', '8.7000', '0.0000', '0.0000', '0.0', '0.0', '0.0']
    def detailsbr2_20100907 = ['2010-09-07', '428.1000', '2.9000', '0.0', '2065.4000', '11.6000', '0.0000', '0.0000', '0.0', '0.0', '0.0']
    def detailsbr2_20100914 = ['2010-09-14', '431.4000', '3.6000', '0.0', '2493.5000', '14.5000', '0.0000', '0.0000', '0.0', '0.0', '0.0']
    def totalbr2 = ['Total', '3000.0000', '21.0000', '-', '-', '-', '75.1000', '2.9000', '-', '-', '-']
    def totalbr2_20100915 = ['Total', '856.2000', '5.8000', '-', '-', '-', '75.1000', '2.9000', '-', '-', '-']

    def thirdBranch = ['Office:', 'br4']
    def detailsbr4_20100828 = ['2010-08-28', '0.0000', '0.0000', '0.0', '0.0000', '0.0000', '621.3000', '7.7000', '0.0', '0.0', '0.0']
    def totalbr4 = ['Total', '0.0000', '0.0000', '-', '-', '-', '621.3000', '7.7000', '-', '-', '-']

    def grandTotalbr2_20100701_20100815 = ['Grand Total', '856.2000', '5.8000', '-', '-', '-', '75.1000', '2.9000', '-', '-', '-']
    def grandTotalbr2_20100701_20100930 = ['Grand Total', '3000.0000', '21.0000', '-', '-', '-', '75.1000', '2.9000', '-', '-', '-']
    def grandTotal_20100701_20100930 = ['Grand Total', '3000.0000', '21.0000', '-', '-', '-', '4213.6000', '19.3000', '-', '-', '-']
    def pageFooter = ['Version 1.0', 'Page', '1 / 1']

    @Test
    void testParams_All_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedBranch.prpt'
            t.reportParams = ['selected_office': '-1', 'start_date': '2010/07/01 00:00:00.000', 'end_date': '2010-09-30']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-09-30')
            t.assertRowEquals(5, ['Office:', ' All'])

            // 1st Group header
            def offset = 6
            t.assertRowEquals(offset, firstBranch)
            // 1st column header
            t.assertRowEquals(offset+1, columnHeader)
            // 1st Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: BO 1 -> 2010-07-18
            t.assertRowEquals(offset+3, detailsBO1_20100718)
            // Branch: BO 1 -> 2010-07-24
            t.assertRowEquals(offset+4, detailsBO1_20100724)
            // 1st Group footer
            t.assertRowEquals(offset+5, totalBO1)

            // 2nd Group header
            offset = 12
            t.assertRowEquals(offset, secondBranch)
            // 2nd column header
            t.assertRowEquals(offset+1, columnHeader)
            // 2nd Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+4, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+5, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(offset+6, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(offset+7, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(offset+8, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(offset+9, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(offset+10, detailsbr2_20100914)
            // 2nd Group footer
            t.assertRowEquals(offset+11, totalbr2)

            // 3rd Group header
            offset = 24
            t.assertRowEquals(offset, thirdBranch)
            // 3rd column header
            t.assertRowEquals(offset+1, columnHeader)
            // 3rd Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: br4 -> 2010-08-28
            t.assertRowEquals(offset+3, detailsbr4_20100828)
            // 3rd Group footer
            t.assertRowEquals(offset+4, totalbr4)

            // Report footer
            offset = 29
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, grandTotal_20100701_20100930)
            // Page footer
            offset = 31
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')

        }
    }

    @Test
    void testParams_br2_20100701_20100930() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedBranch.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010/07/01 00:00:00.000', 'end_date': '2010-09-30']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-09-30')
            t.assertRowEquals(5, ['Office:', 'br2'])

            // Group header
            def offset = 6
            t.assertRowEquals(offset, secondBranch)
            // column header
            t.assertRowEquals(offset+1, columnHeader)
            // Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+4, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+5, detailsbr2_20100810)
            // Branch: br2 -> 2010-08-17
            t.assertRowEquals(offset+6, detailsbr2_20100817)
            // Branch: br2 -> 2010-08-24
            t.assertRowEquals(offset+7, detailsbr2_20100824)
            // Branch: br2 -> 2010-08-31
            t.assertRowEquals(offset+8, detailsbr2_20100831)
            // Branch: br2 -> 2010-09-07
            t.assertRowEquals(offset+9, detailsbr2_20100907)
            // Branch: br2 -> 2010-09-14
            t.assertRowEquals(offset+10, detailsbr2_20100914)
            // Group footer
            t.assertRowEquals(offset+11, totalbr2)

            // Report footer
            offset = 18
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, grandTotalbr2_20100701_20100930)
            // Page footer
            offset = 20
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }

    @Test
    void testParams_br2_20100701_20100815() {
        new PrptReport().execute () { t ->

            // Report settings.
            t.reportPath = 'reports/standardReports/prpts/DueVsCollectedBranch.prpt'
            t.reportParams = ['selected_office': '1.1.1.', 'start_date': '2010/07/01 00:00:00.000', 'end_date': '2010-08-15']

            // MFI Name
            t.assertRowEquals(1, [mfiName])
            // Report title
            t.assertRowEquals(2, [reportName])

            // Page header
            t.assertCellEquals(3, 1, 'From:')
            // TODO t.assertCellEquals(3, 2, '2010-07-01')
            t.assertCellEquals(4, 1, 'To:')
            // TODO t.assertCellEquals(4, 2, '2010-08-15')
            t.assertRowEquals(5, ['Office:', 'br2'])

            // Group header
            def offset = 6
            t.assertRowEquals(offset, secondBranch)
            // column header
            t.assertRowEquals(offset+1, columnHeader)
            // Details header
            t.assertRowEquals(offset+2, detailsHeader)
            // Branch: br2 -> 2010-07-21
            t.assertRowEquals(offset+3, detailsbr2_20100721)
            // Branch: br2 -> 2010-08-03
            t.assertRowEquals(offset+4, detailsbr2_20100803)
            // Branch: br2 -> 2010-08-10
            t.assertRowEquals(offset+5, detailsbr2_20100810)
            // Group footer
            t.assertRowEquals(offset+6, totalbr2_20100915)

            // Report footer
            offset = 13
            t.assertRowEquals(offset, detailsHeader)
            t.assertRowEquals(offset+1, grandTotalbr2_20100701_20100815)
            // Page footer
            offset = 15
            t.assertRowEquals(offset, pageFooter)
            t.assertCellEquals(offset+1, 1, 'Printed by:')
            t.assertCellEquals(offset+1, 2, 'On:')
        }
    }
}
